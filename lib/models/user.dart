// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String fullName;
  final String UserLoginCode;
  final String email;
  final String StoreName;
  final String StoreId;
  final String access_token;
  final List storeList;
  final String merchant;
  // the next field should be removed... but i will add it for demonstration purposes
  final String? address;

  User({
    this.address,
    required this.merchant,
    required this.storeList,
    required this.access_token,
    required this.fullName,
    required this.UserLoginCode,
    required this.email,
    required this.StoreName,
    required this.StoreId,
  });
}
