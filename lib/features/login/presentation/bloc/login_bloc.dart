// presentation/bloc/signup_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_shakti/core/network/custom_exception.dart';
import 'package:project_shakti/features/login/domain/entity/login_entity.dart';
import 'package:project_shakti/features/login/domain/usecase/login_usecase.dart';
import 'package:project_shakti/features/login/presentation/bloc/login_event.dart';
import 'package:project_shakti/features/login/presentation/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;

  LoginBloc({required LoginUseCase loginUseCase})
    : _loginUseCase = loginUseCase,
      super(LoginInitial()) {
    // on<SignUpFormChangedEvent>(_onFormChanged);
    on<LoginSubmittedEvent>(_onSubmitted);
  }

  Future<void> _onSubmitted(
    LoginSubmittedEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    try {
      final request = LoginEntity(
        identifier: event.identifier,
        password: event.password,
      );

      final response = await _loginUseCase(request); // 🔥 UseCase called here

       final token = response.data?.token;

      if (token == null || token.isEmpty) {
        emit(LoginFailure("Token missing from response"));
        return;
      }

      emit(
        LoginSuccess(
          message: response.message ?? "Login successful",
          token: token,
        ),
      ); // ✅ No return/assignment
    } on ValidationException catch (e) {
      emit(LoginFailure(e.message));
    } on ConflictException catch (e) {
      emit(LoginFailure(e.message));
    } on ServerException catch (e) {
      emit(LoginFailure(e.message));
    } on NetworkException catch (e) {
      emit(LoginFailure(e.message));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
