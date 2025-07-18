// data/datasource/signup_remote_datasource_impl.dart

import 'package:project_shakti/core/network/api_response.dart';
import 'package:project_shakti/core/network/client_api.dart';
import 'package:project_shakti/features/signup/data/datasource/signup_remote_datasource.dart';
import 'package:project_shakti/features/signup/data/model/signup_model.dart';

class SignupRemoteDataSourceImpl implements SignupRemoteDataSource {
  final ApiClient apiClient;

  SignupRemoteDataSourceImpl(this.apiClient);

  @override
  Future<ApiResponse<void>> signup(SignupModel signupModel) async {
    final response = await apiClient.post('api/auth/register', signupModel.toJson());

print('Response from signup: ${response.data}');
    return ApiResponse<void>(
      success: response.data['success'],
      message: response.data['message'],
    );
  }
}
