// domain/usecase/signup_usecase.dart

import 'package:project_shakti/core/network/api_response.dart';
import 'package:project_shakti/features/signup/domain/entity/signup_entity.dart';
import 'package:project_shakti/features/signup/domain/repository/sign_up_repository.dart';

class SignupUseCase {
  final SignupRepository repository;

  SignupUseCase(this.repository);

  Future<ApiResponse<void>> call(SignupEntity entity) {
    return repository.signup(entity);
  }
}
