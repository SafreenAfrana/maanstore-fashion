class LoginResponseModel {
  LoginResponseModel(
    this.susses,
    this.statusCode,
    this.code,
    this.message,
    this.data,
  );
  bool susses = false;
  int statusCode = 0;
  String code = '';
  String message = '';
  Data data = Data(token: '', email: '', userName: '', id: 0);
  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    susses = json['susses'];
    statusCode = json['statusCode'];
    code = json['code'];
    data = (json['data'] != null ? Data.fromJson(json['data']) : null)!;
    message = json['message'];
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['susses'] = susses;
    data['statusCode'] = statusCode;
    data['code'] = code;
    data['message'] = message;
    data['data'] = this.data.toJson();
    return data;
  }
}

class Data {
  String token = '';
  int id = 0;
  String email = '';
  String userName = '';
  Data({
    required this.token,
    required this.email,
    required this.userName,
    required this.id,
  });
  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    id = json['id'];
    email = json['email'];
    userName = json['userName'];
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['id'] = id;
    data['userName'] = userName;
    data['email'] = email;

    return data;
  }
}
