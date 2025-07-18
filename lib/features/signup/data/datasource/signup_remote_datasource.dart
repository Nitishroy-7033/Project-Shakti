// data/datasource/signup_remote_datasource.dart

import 'package:project_shakti/features/signup/data/model/signup_model.dart';
import 'package:project_shakti/core/network/api_response.dart';

abstract class SignupRemoteDataSource {
  Future<ApiResponse<void>> signup(SignupModel signupModel);
}
