// // domain/repository/sign_up_repository.dart

// import 'package:project_shakti/core/network/api_response.dart';
// import 'package:project_shakti/features/signup/models/signup_entity.dart';

// abstract class SignupRepository {
//   Future<ApiResponse<void>> signup(SignupEntity signupEntity);
// }


// import 'package:project_shakti/core/network/api_response.dart';
// import 'package:project_shakti/core/network/client_api.dart';
// import 'package:project_shakti/features/login/login_2/models/login_model.dart';

// class LoginRepository {
//   final ApiClient _apiClient = ApiClient(); // Singleton instance

//   /// Sends signup request with user details
//   Future<ApiResponse<void>> login(LoginModel model) async {
//     return await _apiClient.post<void>(
//       'api/auth/login',
//       model.toJson(),
//       useToken: false, // SignUp usually doesn't need token
//       fromJson: (_) => null, // No actual data expected in response
//     );
//   }
// }


import 'package:project_shakti/core/network/api_response.dart';
import 'package:project_shakti/core/network/client_api.dart';
import 'package:project_shakti/features/login/models/login_model.dart';
import 'package:project_shakti/features/login/models/login_response_model.dart';

class LoginRepository {
  final ApiClient _apiClient = ApiClient();

  Future<ApiResponse<LoginResponseModel>> login(LoginModel model) async {
    return await _apiClient.post<LoginResponseModel>(
      'api/auth/login',
      model.toJson(),
      useToken: false,
      fromJson: (json) => LoginResponseModel.fromJson(json),
    );
  }
}
