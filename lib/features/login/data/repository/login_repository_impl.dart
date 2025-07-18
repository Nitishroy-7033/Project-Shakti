// data/repository/signup_repository_impl.dart

import 'package:project_shakti/core/network/api_response.dart';
import 'package:project_shakti/features/login/data/datasource/login_remote_datasource.dart';
import 'package:project_shakti/features/login/data/model/login_model.dart';
import 'package:project_shakti/features/login/data/model/login_response_model.dart';
import 'package:project_shakti/features/login/domain/entity/login_entity.dart';
import 'package:project_shakti/features/login/domain/repository/login_repository.dart';
import 'package:project_shakti/features/signup/data/datasource/signup_remote_datasource.dart';
import 'package:project_shakti/features/signup/data/model/signup_model.dart';
import 'package:project_shakti/features/signup/domain/entity/signup_entity.dart';
import 'package:project_shakti/features/signup/domain/repository/sign_up_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl(this.remoteDataSource);

  @override
  Future<ApiResponse<LoginResponseModel>> login(LoginEntity loginEntity) {
    final model = LoginModel.fromEntity(loginEntity);
    return remoteDataSource.login(model);
  }
  
 
}
