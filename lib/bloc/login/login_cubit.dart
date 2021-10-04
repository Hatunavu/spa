import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nam_training/bloc/login/login_state.dart';
import 'package:nam_training/model/api_model.dart';
import 'package:nam_training/repository/user_repository.dart';

class LoginCubit extends Cubit<LoginState> {
  final UserRepository userRepository;
  LoginCubit({required this.userRepository}) : super(LoginStateInitial());
  Future<void> loginButtonPressed(LoginRequestModel requestModel) async {
    emit(LoginStateLoading());
    try {
      await userRepository.loginDio(requestModel);
      emit(LoginStateSuccess());
    } catch (e) {
      emit(LoginStateFailure());
    }
  }
}
