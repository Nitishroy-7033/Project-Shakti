

// // presentation/bloc/signup_bloc.dart

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:project_shakti/core/network/custom_exception.dart';
// import 'package:project_shakti/features/signup/bloc/signup_event.dart';
// import 'package:project_shakti/features/signup/bloc/signup_state.dart';

// class SignUpBloc extends Bloc<SignupEvent, SignUpState> {
//   final SignupUseCase _signupUseCase;

//   SignUpBloc({required SignupUseCase signupUseCase})
//       : _signupUseCase = signupUseCase,
//         super(SignUpInitial()) {
//     // on<SignUpFormChangedEvent>(_onFormChanged);
//     on<SignUpSubmittedEvent>(_onSubmitted);
//   }



//   Future<void> _onSubmitted(SignUpSubmittedEvent event, Emitter<SignUpState> emit) async {
//   emit(SignUpLoading());

//   try {
//     final request = SignupEntity(
//       firstName: event.firstName.trim(),
//       lastName: event.lastName.trim(),
//       email: event.email.trim(),
//       phone: event.phone.trim(),
//       password: event.password,
//       confirmPassword: event.confirmPassword,
//     );

//     final response = await _signupUseCase(request); // 🔥 UseCase called here

//     emit(SignUpSuccess(response.message ?? "Signup successful"));
//   } on ValidationException catch (e) {
//     emit(SignUpFailure(e.message));
//   } on ConflictException catch (e) {
//     emit(SignUpFailure(e.message));
//   } on ServerException catch (e) {
//     emit(SignUpFailure(e.message));
//   } on NetworkException catch (e) {
//     emit(SignUpFailure(e.message));
//   } catch (e) {
//     emit(SignUpFailure(e.toString()));
//   }
// }

// }


// lib/features/signup/bloc/signup_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_shakti/core/network/custom_exception.dart';
import 'package:project_shakti/features/login/bloc/login_event.dart';
import 'package:project_shakti/features/login/bloc/login_state.dart';
import 'package:project_shakti/features/login/models/login_model.dart';
import 'package:project_shakti/features/login/repository/login_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _loginrepository;

  LoginBloc({required LoginRepository loginrepository})
    : _loginrepository = loginrepository,
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
      final request = LoginModel(
        identifier: event.identifier,
        password: event.password,
      );

      final response = await _loginrepository.login(request); // 🔥 UseCase called here

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
