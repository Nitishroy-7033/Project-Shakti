// data/model/login_response_model.dart

class LoginResponseModel {
  final String token;

  LoginResponseModel({required this.token});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json['token'] ?? '',
    );
  }
}
