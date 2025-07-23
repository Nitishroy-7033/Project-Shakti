// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpFormChangedEvent extends SignupEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;
  final String confirmPassword;
  final bool acceptTerms;

   SignUpFormChangedEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmPassword,
    required this.acceptTerms,
  });

  @override
  List<Object?> get props => [
    firstName, lastName, email, phone, password, confirmPassword, acceptTerms
  ];
}

class SignUpSubmittedEvent extends SignupEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;
  final String confirmPassword;
  final bool acceptTerms;

   SignUpSubmittedEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmPassword,
    required this.acceptTerms,
  });

  @override
  List<Object?> get props => [
    firstName, lastName, email, phone, password, confirmPassword, acceptTerms
  ];
}



