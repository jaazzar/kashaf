import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';
import 'package:wosul_app/controllers/userController.dart';
import 'package:wosul_app/models/user.dart';

final UserServicesProvider = Provider((ref) => UserServices(ref));

class UserServices {
  final Ref _ref;

  UserServices(this._ref);

  getUserByEmailAndPassword(String email, String password, String merchant,
      [int? storeId]) async {
    Uri uri = Uri.https("$merchant.wosulstage.com", "/api/user/authenticate");

    var storeList = await getStoreListByEmail(email);

    if (storeList == null) {
      return null;
    }

    int firstStoreId = storeList.first["id"];

    Map data = {
      "email": email,
      "password": password,
      "store_id": storeId ?? firstStoreId,
      "approve": 1,
    };

    // the headers added to the request
    var headers = {"Content-Type": "application/json"};

    var response =
        await http.post(uri, body: json.encode(data), headers: headers);

    var responseBody = json.decode(response.body);
    print(responseBody);
    if (responseBody["status_code"] != 200) {
      return null;
    }
    return User(
      fullName: responseBody["data"]["fullname"],
      email: responseBody["data"]["email"],
      merchant: merchant,
      UserLoginCode: responseBody["data"]["login_code"].toString(),
      StoreName: responseBody["data"]["store"]["name"],
      StoreId: responseBody["data"]["store"]['id'].toString(),
      access_token: responseBody["data"]["access_token"],
      storeList: storeList,
      address: responseBody["data"]["store"]['address'],
    );
  }

  // (return null if user does not exist)
  getUserByCode(String code, String merchant, [int? storeId]) async {
    Uri uri = Uri.https("$merchant.wosulstage.com", "/api/login_with_code");
    var storeList = await getStoreListByCode(code);
    if (storeList == null) {
      return null;
    }

    String firstStoreId = storeList.first["id"].toString();

    Map data = {
      "code": code,
      "store_id": storeId ?? firstStoreId,
      "approve": 1,
    };

    // the headers added to the request
    var headers = {"Content-Type": "application/json"};

    var response =
        await http.post(uri, body: json.encode(data), headers: headers);

    var responseBody = json.decode(response.body);

    if (responseBody["msg"] != "Authenticated successfully") {
      return null;
    }

    var loginCode = responseBody["data"]["login_code"].toString();

    while (loginCode.length < 5) {
      loginCode = "0" + loginCode;
    }

    return User(
      fullName: responseBody["data"]["fullname"],
      email: responseBody["data"]["email"],
      UserLoginCode: loginCode,
      merchant: merchant,
      StoreName: responseBody["data"]["store"]["name"],
      StoreId: responseBody["data"]["store"]['id'].toString(),
      access_token: responseBody["data"]["access_token"],
      address: responseBody["data"]["store"]['address'],
      storeList: storeList,
    );
  }

  Future changeStore(
      int storeId, String merch, String loginCode, List storeList) async {
    Uri uri = Uri.https("$merch.wosulstage.com", "/api/login_with_code");

    // the headers added to the request
    var headers = {"Content-Type": "application/json"};

    Map data = {
      "code": loginCode,
      "store_id": storeId,
      "approve": 1,
    };

    var response =
        await http.post(uri, body: json.encode(data), headers: headers);

    var responseBody = json.decode(response.body);

    print(responseBody);

    if (responseBody["status_code"] != 200) {
      return null;
    }
    return User(
      fullName: responseBody["data"]["fullname"],
      email: responseBody["data"]["email"],
      merchant: merch,
      UserLoginCode: responseBody["data"]["login_code"].toString(),
      StoreName: responseBody["data"]["store"]["name"],
      StoreId: responseBody["data"]["store"]['id'].toString(),
      access_token: responseBody["data"]["access_token"],
      storeList: storeList,
      address: responseBody["data"]["store"]['address'],
    );
  }

  // this method lists all stores By code
  getStoreListByCode(String code) async {
    // Getting the uri so we can use it in the request
    Uri uri = Uri.https("demo.wosulstage.com", "/api/store_list_by_code");

    var body = json.encode({"code": code});

    // the headers added to the request
    var headers = {"Content-Type": "application/json"};

    var response = await http.post(uri, body: body, headers: headers);
    var responseBody = json.decode(response.body);

    if (responseBody["status_code"] != 200) {
      return null;
    }

    return responseBody["data"];
  }

  // this method lists all stores
  getStoreListByEmail(String email) async {
    // Getting the uri so we can use it in the request
    Uri uri = Uri.https("demo.wosulstage.com", "/api/store/list_stores");

    var body = json.encode({"email": email});

    // the headers added to the request
    var headers = {"Content-Type": "application/json"};

    var response = await http.post(uri, body: body, headers: headers);
    var responseBody = json.decode(response.body);

    if (responseBody["status_code"] != 200) {
      return null;
    }

    return responseBody["data"];
  }

  // a method that resets the providers state back to null
  // and sends a post request to the api to logout
  logout(String access_token) async {
    Uri uri = Uri.https("demo.wosulstage.com", "api/logout");

    var body = json.encode({"access_token": access_token});
    var headers = {"Content-Type": "application/json"};

    var response = await http.post(uri, body: body, headers: headers);

    return response;
  }

  // a method that sends a post request to the api to reset password
  forgotPassword(String email) async {
    Uri uri = Uri.https("demo.wosulstage.com", "/api/user/forgot_password");

    var body = json.encode({"email": email});
    var headers = {"Content-Type": "application/json"};

    var response = await http.post(uri, body: body, headers: headers);
    //response = json.decode(response.body);
    var responseBody = json.decode(response.body);

    return responseBody["status_code"] == 200 ? true : false;
  }
}
