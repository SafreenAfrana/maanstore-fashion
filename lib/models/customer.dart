class CustomerModel {
  CustomerModel(
      {required this.email, required this.userName, required this.password});
  String email;
  String userName;
  String password;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map.addAll({
      'email': email,
      'userName': userName,
      'password': password,
    });
    return map;
  }
}
