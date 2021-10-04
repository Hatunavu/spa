import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:nam_training/local_storage/storage.dart';
import 'package:nam_training/model/api_model.dart';
import 'package:nam_training/model/response_model.dart';
import 'package:nam_training/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:nam_training/styles/text.dart';

abstract class UserRepository {
  Future<void> sentOtp(
      {required String phoneNumber,
      required Duration timeOut,
      required PhoneVerificationFailed phoneVerificationFailed,
      required PhoneVerificationCompleted phoneVerificationCompleted,
      required PhoneCodeSent phoneCodeSent,
      required PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout});
  Future<UserCredential> verifyAndLogin(String verificationId, String smsCode);
  Future<void> signOut();
  Future<ResponseModel> fetchDataDio();

  Future<User?> getUser();
  Future<void> loginDio(LoginRequestModel requestModel);

  Future<bool> hasToken();
  Future<void> uploadAvtDio(String filePath);
  Future<void> refreshToken();

  Future<Dio> getApiClient();
}

class UserRepositoryImplement implements UserRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Storage storage = Storage();
  final dio = Dio();

  @override
  Future<Dio> getApiClient() async {
    final userModel = UserModel.fromJson(await storage.read('token'));
    dio.interceptors.add(
      InterceptorsWrapper(onRequest: (options, handler) {
        options.headers['Authorization'] = 'Bearer ${userModel.accessToken}';
        return handler.next(options);
      }, onResponse: (response, handler) {
        return handler.next(response);
      }, onError: (DioError e, handler) async {
        if (e.response?.statusCode == 401) {
          await refreshToken();
        } else {
          handler.next(e);
        }
      }),
    );
    return dio;
  }

  @override
  Future<void> refreshToken() async {
    final userModel = UserModel.fromJson(await storage.read('token'));
    final Map<String, String> headers = Map<String, String>()
      ..putIfAbsent('Accept', () => 'application/json')
      ..putIfAbsent('Content-Type', () => 'application/x-www-form-urlencoded');
    final Map<String, String> body = Map<String, String>()
      ..putIfAbsent('grant_type', () => 'refresh_token')
      ..putIfAbsent('refresh_token', () => '${userModel.refreshToken}');
    final response = await dio.request(
      tokenUrl,
      options: Options(
          method: 'POST', responseType: ResponseType.plain, headers: headers),
      data: body,
    );
    if (response.statusCode == 200) {
      await storage.remove('token');
      await storage.save('token', response.data);
    }
  }

  @override
  Future<void> loginDio(LoginRequestModel requestModel) async {
    final Map<String, String> headers = Map<String, String>()
      ..putIfAbsent('Accept', () => 'application/json')
      ..putIfAbsent('Content-Type', () => 'application/x-www-form-urlencoded');
    final response = await dio.post(tokenUrl,
        data: requestModel.toJson(),
        options: Options(headers: headers, responseType: ResponseType.plain));
    if (response.statusCode == 200) {
      await storage.save('token', response.data);
    }
  }

  @override
  Future<ResponseModel> fetchDataDio() async {
    final Dio _dio = await getApiClient();
    final Map<String, String> headers = Map<String, String>()
      ..putIfAbsent('Accept', () => 'application/json');
    final responseData = await _dio.get(getDataUrl,
        options: Options(responseType: ResponseType.plain, headers: headers));
    if (responseData.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(responseData.data));
    }
    return Future.error(
      'Error while fetching.',
      StackTrace.fromString('${responseData.data}'),
    );
  }

  @override
  Future<void> uploadAvtDio(String filePath) async {
    final _dio = await getApiClient();
    final FormData formData =
        FormData.fromMap({'file': await MultipartFile.fromFile(filePath)});
    await _dio.post(uploadDataUrl,
        options: Options(responseType: ResponseType.plain, headers: {
          'Content-Type': 'multipart/form-data',
          'Authorization':
              'Bearer ${UserModel.fromJson(await storage.read('token')).accessToken}'
        }),
        data: formData);
  }

  @override
  Future<bool> hasToken() async {
    late bool result;
    try {
      final UserModel userModel =
          UserModel.fromJson(await storage.read('token'));
      if (userModel.accessToken.isNotEmpty) {
        result = true;
      }
    } catch (e) {
      result = false;
    }

    return result;
  }

  @override
  Future<void> sentOtp(
      {required String phoneNumber,
      required Duration timeOut,
      required PhoneVerificationFailed phoneVerificationFailed,
      required PhoneVerificationCompleted phoneVerificationCompleted,
      required PhoneCodeSent phoneCodeSent,
      required PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout}) async {
    await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: phoneVerificationCompleted,
        verificationFailed: phoneVerificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: autoRetrievalTimeout,
        timeout: const Duration(seconds: 30));
  }

  @override
  Future<UserCredential> verifyAndLogin(
      String verificationId, String smsCode) async {
    final AuthCredential authCredential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    return _firebaseAuth.signInWithCredential(authCredential);
  }

  @override
  Future<void> signOut() {
    return Future.wait([_firebaseAuth.signOut(), storage.remove('token')]);
  }

  @override
  Future<User?> getUser() async {
    return _firebaseAuth.currentUser;
  }
}
