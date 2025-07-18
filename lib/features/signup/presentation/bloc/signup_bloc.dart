

// presentation/bloc/signup_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_shakti/core/network/custom_exception.dart';
import 'package:project_shakti/features/signup/domain/entity/signup_entity.dart';
import 'package:project_shakti/features/signup/domain/usecase/signup_usecase.dart';
import 'package:project_shakti/features/signup/presentation/bloc/signup_event.dart';
import 'package:project_shakti/features/signup/presentation/bloc/signup_state.dart';

class SignUpBloc extends Bloc<SignupEvent, SignUpState> {
  final SignupUseCase _signupUseCase;

  SignUpBloc({required SignupUseCase signupUseCase})
      : _signupUseCase = signupUseCase,
        super(SignUpInitial()) {
    // on<SignUpFormChangedEvent>(_onFormChanged);
    on<SignUpSubmittedEvent>(_onSubmitted);
  }



  Future<void> _onSubmitted(SignUpSubmittedEvent event, Emitter<SignUpState> emit) async {
  emit(SignUpLoading());

  try {
    final request = SignupEntity(
      firstName: event.firstName.trim(),
      lastName: event.lastName.trim(),
      email: event.email.trim(),
      phone: event.phone.trim(),
      password: event.password,
      confirmPassword: event.confirmPassword,
    );

    final response = await _signupUseCase(request); // 🔥 UseCase called here

    emit(SignUpSuccess(response.message ?? "Signup successful"));
  } on ValidationException catch (e) {
    emit(SignUpFailure(e.message));
  } on ConflictException catch (e) {
    emit(SignUpFailure(e.message));
  } on ServerException catch (e) {
    emit(SignUpFailure(e.message));
  } on NetworkException catch (e) {
    emit(SignUpFailure(e.message));
  } catch (e) {
    emit(SignUpFailure(e.toString()));
  }
}

}
