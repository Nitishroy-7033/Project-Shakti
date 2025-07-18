// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginFormChangedEvent extends LoginEvent {
 final String identifier;
  final String password;


   LoginFormChangedEvent({
   required this.identifier,
    required this.password,
    
  });

  @override
  List<Object?> get props => [
    identifier, password
  ];
}

class LoginSubmittedEvent extends LoginEvent {
  final String identifier;
  final String password;
  

   LoginSubmittedEvent({
   required this.identifier,
    required this.password,
  
  });

  @override
  List<Object?> get props => [
    identifier, password
  ];
}



