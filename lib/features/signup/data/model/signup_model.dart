// data/model/signup_model.dart

import 'package:project_shakti/features/signup/domain/entity/signup_entity.dart';

class SignupModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phone; 
  final String password;
  final String confirmPassword;

  SignupModel({
    required this.firstName,
    required this.lastName,
    required this.phone, 
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  factory SignupModel.fromEntity(SignupEntity entity) {
    return SignupModel(
      firstName: entity.firstName,
      lastName: entity.lastName,
      email: entity.email,
      password: entity.password,
      confirmPassword: entity.confirmPassword,
        phone: entity.phone, 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'full_name': '$firstName $lastName',
      "email": email,
      "phone": phone,
      "password": password,
    };
  }
}
