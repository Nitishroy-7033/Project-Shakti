// data/datasource/signup_remote_datasource.dart

import 'package:project_shakti/features/login/data/model/login_model.dart';
import 'package:project_shakti/features/login/data/model/login_response_model.dart';
import 'package:project_shakti/features/signup/data/model/signup_model.dart';
import 'package:project_shakti/core/network/api_response.dart';

abstract class LoginRemoteDataSource {
  Future<ApiResponse<LoginResponseModel>> login(LoginModel loginModel);
}
