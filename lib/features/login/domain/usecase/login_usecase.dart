// domain/usecase/signup_usecase.dart

import 'package:project_shakti/core/network/api_response.dart';
import 'package:project_shakti/features/login/data/model/login_response_model.dart';
import 'package:project_shakti/features/login/domain/entity/login_entity.dart';
import 'package:project_shakti/features/login/domain/repository/login_repository.dart';

class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  Future<ApiResponse<LoginResponseModel>> call(LoginEntity entity) {
    return repository.login(entity);
  }
}
