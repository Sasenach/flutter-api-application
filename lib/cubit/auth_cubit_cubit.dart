import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
// import 'package:conduit_app/page/sign_in.dart';
import 'package:conduit_application/app_env.dart';
import '../model/user.dart';

part 'auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.dio) : super(InitalState());

  final Dio dio;

  Future<User> SignUp(User user) async {
    User userRet = User(id: 0, userName: '', email: '');

    try {
      var result = await dio.put("http://127.0.0.1:2222/token", data: {
        "userName": user.userName,
        "email": user.email,
        "password": user.password,
      });
      var data = User.fromJson(result.data['data']);
      userRet = data;
      if (result.statusCode == 200) {
        if (data.refreshToken == null) {
          throw DioError(
              requestOptions: RequestOptions(path: ''), error: 'нулевой токен');
        }
        emit(SuccesState());
      }
    } on DioError catch (e) {
      emit(ErrorState(e.response!.data['message']));
    }
    return userRet;
  }

  Future<User> SignIn(User user) async {
    User userRet = User(id: 0, userName: '', email: '');
    try {
      // var result = await dio.post(AppEnv.protocol+AppEnv.ip+AppEnv.auth, data: user);

      var result = await dio.post(
        'http://127.0.0.1:2222/token',
        data: {
          "userName": user.userName,
          "password": user.password,
        },
        options: Options(responseType: ResponseType.json),
      );
      // var data = json.decode(result.data['data'].toString());
      var data = User.fromJson(result.data['data']);
      userRet = data;
      if (result.statusCode == 200) {
        if (data.accessToken == null) {
          throw DioError(
              requestOptions: RequestOptions(path: ''), error: 'нулевой токен');
        }
        emit(SuccesState());
      }
    } on DioError catch (e) {
      emit(ErrorState(e.response!.data['message']));
      print(e.response!.data);
      print(e.response!.statusCode);
      print(e.response!.statusMessage);
    }
    return userRet;
  }
}
