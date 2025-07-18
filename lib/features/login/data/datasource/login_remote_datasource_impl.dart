// data/datasource/signup_remote_datasource_impl.dart

import 'package:project_shakti/core/network/api_response.dart';
import 'package:project_shakti/core/network/client_api.dart';
import 'package:project_shakti/features/login/data/datasource/login_remote_datasource.dart';
import 'package:project_shakti/features/login/data/model/login_model.dart';
import 'package:project_shakti/features/login/data/model/login_response_model.dart';
import 'package:project_shakti/features/signup/data/datasource/signup_remote_datasource.dart';
import 'package:project_shakti/features/signup/data/model/signup_model.dart';

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final ApiClient apiClient;

  LoginRemoteDataSourceImpl(this.apiClient);

  @override
  Future<ApiResponse<LoginResponseModel>> login(LoginModel loginModel) async {
    final response = await apiClient.post('api/auth/login', loginModel.toJson());

print('Response from Login: ${response.data}');
    return ApiResponse<LoginResponseModel>(
      success: response.data['success'],
      message: response.data['message'],
       data: response.data['data'] != null
          ? LoginResponseModel.fromJson(response.data['data'])
          : null,
      
    );
  }
}
