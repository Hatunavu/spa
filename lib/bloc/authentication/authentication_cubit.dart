import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nam_training/bloc/authentication/authentication_state.dart';
import 'package:nam_training/repository/user_repository.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final UserRepository _userRepository;
  AuthenticationCubit(this._userRepository)
      : super(AuthenticationStateInitial());
  Future<void> started() async {
    try {
      final bool hasUser = await _userRepository.getUser() != null;
      final bool hasToken = await _userRepository.hasToken();
      if (hasToken || hasUser) {
        emit(AuthenticationStateAuthenticated());
      } else {
        emit(AuthenticationStateUnauthenticated());
      }
    } catch (e) {
      emit(AuthenticationStateFailure());
    }
  }

  Future<void> loggedIn() async {
    try {
      emit(AuthenticationStateAuthenticated());
    } catch (e) {
      emit(AuthenticationStateFailure());
    }
  }

  Future<void> loggedOut() async {
    await _userRepository.signOut();
    // await _userRepository.deleteToken();
    emit(AuthenticationStateUnauthenticated());
  }
}
