import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nam_training/bloc/register/register_state.dart';
import 'package:nam_training/repository/user_repository.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final UserRepository _userRepository;
  RegisterCubit({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(RegisterStateInitial());

  String verID = '';
  Future<void> sentOtpEvent(String phoneNumber) async {
    emit(RegisterStateLoading());

    await sentOtp(phoneNumber);
  }

  void otpSent() {
    emit(RegisterStateOtpSent());
  }

  void complete(User user) {
    emit(RegisterStateComplete(user));
  }

  void exception(String message) {
    emit(RegisterStateException(message));
  }

  Future<void> veriifyOtp(String otp) async {
    emit(RegisterStateLoading());
    try {
      final UserCredential credential =
          await _userRepository.verifyAndLogin(verID, otp);
      if (credential.user != null) {
        emit(RegisterStateComplete(credential.user!));
      } else {
        emit(RegisterStateException('Invalid otp'));
      }
    } catch (e) {
      emit(RegisterStateException('Invalid otp'));
    }
  }

  Future<void> sentOtp(String phoneNumber) async {
    final phoneVerificationCompleted = (AuthCredential authCredential) {
      _userRepository.getUser();
      _userRepository.getUser().catchError((onError) {}).then((user) {
        complete(user!);
      });
    };
    final phoneVeriaficationFailed = (FirebaseAuthException authException) {
      exception('Invalid phone number');
    };
    final phoneCodeSent = (String verID, [int? forceResent]) {
      this.verID = verID;
      otpSent();
    };
    final phoneCodeAutoRetrievalTimeOut = (String verid) {
      verID = verid;
    };
    await _userRepository.sentOtp(
        phoneNumber: phoneNumber,
        timeOut: const Duration(seconds: 1),
        phoneVerificationFailed: phoneVeriaficationFailed,
        phoneVerificationCompleted: phoneVerificationCompleted,
        phoneCodeSent: phoneCodeSent,
        autoRetrievalTimeout: phoneCodeAutoRetrievalTimeOut);
  }
}
