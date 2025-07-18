// data/repository/signup_repository_impl.dart

import 'package:project_shakti/core/network/api_response.dart';
import 'package:project_shakti/features/signup/data/datasource/signup_remote_datasource.dart';
import 'package:project_shakti/features/signup/data/model/signup_model.dart';
import 'package:project_shakti/features/signup/domain/entity/signup_entity.dart';
import 'package:project_shakti/features/signup/domain/repository/sign_up_repository.dart';

class SignupRepositoryImpl implements SignupRepository {
  final SignupRemoteDataSource remoteDataSource;

  SignupRepositoryImpl(this.remoteDataSource);

  @override
  Future<ApiResponse<void>> signup(SignupEntity signupEntity) {
    final model = SignupModel.fromEntity(signupEntity);
    return remoteDataSource.signup(model);
  }
}
