// domain/repository/sign_up_repository.dart

import 'package:project_shakti/core/network/api_response.dart';
import 'package:project_shakti/features/signup/domain/entity/signup_entity.dart';

abstract class SignupRepository {
  Future<ApiResponse<void>> signup(SignupEntity signupEntity);
}
