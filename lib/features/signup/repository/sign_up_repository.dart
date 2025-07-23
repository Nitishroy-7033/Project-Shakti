import 'package:project_shakti/core/network/api_response.dart';
import 'package:project_shakti/core/network/client_api.dart';
import 'package:project_shakti/features/signup/models/signup_model.dart';

class SignupRepository {
  final ApiClient _apiClient = ApiClient(); // Singleton instance

  /// Sends signup request with user details
  Future<ApiResponse<void>> signup(SignupModel model) async {
    return await _apiClient.post<void>(
      'api/auth/register',
      model.toJson(),
      useToken: false, // SignUp usually doesn't need token
      fromJson: (_) => null, // No actual data expected in response
    );
  }
}
