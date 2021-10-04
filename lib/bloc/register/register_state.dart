import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterStateInitial extends RegisterState {}

class RegisterStateOtpSent extends RegisterState {}

class RegisterStateLoading extends RegisterState {}

class LoginStateOtpVerified extends RegisterState {}

class RegisterStateComplete extends RegisterState {
  final User user;
  RegisterStateComplete(this.user);
  User getUser() {
    return user;
  }

  @override
  List<Object> get props => [user];
}

class RegisterStateException extends RegisterState {
  final String message;
  RegisterStateException(this.message);
  @override
  List<Object> get props => [message];
}
