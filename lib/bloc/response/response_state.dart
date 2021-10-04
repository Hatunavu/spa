import 'package:equatable/equatable.dart';
import 'package:nam_training/model/response_model.dart';

abstract class ResponseState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ResponseStateInitial extends ResponseState {}

class ResponseStateLoading extends ResponseState {}

class ResponseStateSuccess extends ResponseState {
  final ResponseModel responseModel;
  ResponseStateSuccess({required this.responseModel});
  @override
  // TODO: implement props
  List<Object?> get props => [responseModel];
}

class ResponseStateUploadSuccess extends ResponseState {}

class ResponseStateFailure extends ResponseState {}
