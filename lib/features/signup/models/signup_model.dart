// lib/data/model/signup_model.dart

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
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'full_name': '$firstName $lastName',     // ✅ Confirm this matches your backend
      'email': email,
      'phone': phone,
      'password': password,
      'confirm_password': confirmPassword,
    };
  }
}
