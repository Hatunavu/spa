import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nam_training/bloc/response/response_state.dart';
import 'package:nam_training/repository/user_repository.dart';

class ResponseCubit extends Cubit<ResponseState> {
  final UserRepository userRepository;
  ResponseCubit({required this.userRepository}) : super(ResponseStateInitial());

  Future<void> fetchData() async {
    emit(ResponseStateLoading());
    try {
      await userRepository.fetchDataDio().then((value) {
        emit(ResponseStateSuccess(responseModel: value));
      });
    } catch (e) {
      emit(ResponseStateFailure());
    }
  }

  Future<void> uploadAvt(String filePath) async {
    emit(ResponseStateLoading());
    try {
      await userRepository.uploadAvtDio(filePath).then((value) {
        emit(ResponseStateUploadSuccess());
      });
    } catch (e) {
      emit(ResponseStateFailure());
    }
  }
}
