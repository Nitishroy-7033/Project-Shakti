// data/model/signup_model.dart

import 'package:project_shakti/features/login/domain/entity/login_entity.dart';
import 'package:project_shakti/features/signup/domain/entity/signup_entity.dart';

class LoginModel {
  final String identifier;
  final String password;

  LoginModel({
    required this.identifier,
    required this.password,
  });

  factory LoginModel.fromEntity(LoginEntity entity) {
    return LoginModel(
      
      password: entity.password, identifier: entity.identifier,
      
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'identifier': identifier,
      "password": password,
    };
  }
}
