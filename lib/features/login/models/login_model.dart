// lib/data/model/signup_model.dart

class LoginModel {
   final String identifier;
  final String password;

  LoginModel({
    required this.identifier,
    required this.password,
    
  });

  Map<String, dynamic> toJson() {
    return {
      'identifier': identifier,
      "password": password,
    };
  }
}
