import 'package:get_it/get_it.dart';
import 'package:project_shakti/core/network/client_api.dart';
import 'package:project_shakti/features/login/data/datasource/login_remote_datasource.dart';
import 'package:project_shakti/features/login/data/datasource/login_remote_datasource_impl.dart';
import 'package:project_shakti/features/login/data/repository/login_repository_impl.dart';
import 'package:project_shakti/features/login/domain/repository/login_repository.dart';
import 'package:project_shakti/features/login/domain/usecase/login_usecase.dart';
import 'package:project_shakti/features/signup/data/datasource/signup_remote_datasource.dart';
import 'package:project_shakti/features/signup/data/datasource/signup_remote_datasource_impl.dart';
import 'package:project_shakti/features/signup/data/repository/signup_repository_impl.dart';
import 'package:project_shakti/features/signup/domain/repository/sign_up_repository.dart';
import 'package:project_shakti/features/signup/domain/usecase/signup_usecase.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // ✅ Register ApiClient
  getIt.registerLazySingleton(() => ApiClient()); // pass token if needed

  // ✅ Register SignupRemoteDataSource with interface binding
  getIt.registerLazySingleton<SignupRemoteDataSource>(
    () => SignupRemoteDataSourceImpl(getIt()),
  );

  // ✅ Register SignupRepository
  getIt.registerLazySingleton<SignupRepository>(
    () => SignupRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton(
    () => SignupUseCase(getIt()),
  ); // 🔥 Register usecase here

  // ✅  LoginRemoteDataSource with interface binding
  getIt.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSourceImpl(getIt()),
  );

  // ✅ LOgin Repository
  getIt.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton(
    () => LoginUseCase(getIt()),
  ); // 🔥 Register usecase here
}
