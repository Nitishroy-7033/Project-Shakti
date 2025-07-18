// domain/repository/sign_up_repository.dart

import 'package:project_shakti/core/network/api_response.dart';
import 'package:project_shakti/features/login/data/model/login_response_model.dart';
import 'package:project_shakti/features/login/domain/entity/login_entity.dart';
import 'package:project_shakti/features/signup/domain/entity/signup_entity.dart';

abstract class LoginRepository {
  Future<ApiResponse<LoginResponseModel>> login(LoginEntity loginEntity);
}
