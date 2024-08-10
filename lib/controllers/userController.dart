import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:wosul_app/models/user.dart";

import "package:wosul_app/models/userServices.dart";
import "package:wosul_app/providers/currentStore.dart";

class UserController extends StateNotifier<User?> {
  final UserServices _userServices;
  final Ref _ref;

  UserController(
    this._userServices,
    this._ref,
  ) : super(null);

  // this is a method that will log in a user using there email and password
  Future<void> getUserByEmailAndPassword(
      String email, String password, String merchant,
      [int? storeId]) async {
    var user;
    if (storeId == null) {
      user = await _userServices.getUserByEmailAndPassword(
          email, password, merchant);
    } else {
      user = await _userServices.getUserByEmailAndPassword(
          email, password, merchant, storeId);
    }

    // check something
    if (true) {
      final storelist = await getStoreListByEmail(email);
      if (storelist != null) {
        _ref
            .watch(currentStoreProvider.notifier)
            .changeStore((storelist).first['id']);

        state = user;
      }
    }
  }

  // this is a method that will log in a user using there email and password
  Future<void> getUserByCode(String code, String merchant,
      [int? storeId]) async {
    var user;
    if (storeId == null) {
      user = await _userServices.getUserByCode(code, merchant);
    } else {
      user = await _userServices.getUserByCode(code, merchant, storeId);
    }

    // check something
    if (user != null) {
      _ref
          .watch(currentStoreProvider.notifier)
          .changeStore((await getStoreListByCode(code)).first['id']);
      state = user;
    }
  }

  Future<void> changeStore(int storeId) async {
    final user = await _userServices.changeStore(
        storeId, state!.merchant, state!.UserLoginCode, state!.storeList);

    // check something
    if (user != null) {
      _ref.watch(currentStoreProvider.notifier).changeStore(storeId);
      state = await user;
    }
  }

  getStoreListByEmail(String email) async {
    var list = await _userServices.getStoreListByEmail(email);

    if (list == null) {
      return null;
    }

    return list;
  }

  getStoreListByCode(String code) async {
    var list = await _userServices.getStoreListByCode(code);

    if (list == null) {
      return null;
    }

    return list;
  }

  // this is a method that is going to logout a user... meaning it will set state as null which will triger a listener
  void logout() async {
    var respoes = await _userServices.logout(state!.access_token);
    state = null;
  }

  forgotPassword(String email) async {
    var respoes = await _userServices.forgotPassword(email);
    return respoes;
  }
}

final userControllerProvider = StateNotifierProvider<UserController, User?>(
    (ref) => UserController(ref.watch(UserServicesProvider), ref));

var StoreListProvider = Provider((ref) => null);
