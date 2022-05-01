import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:hive/hive.dart';
import 'package:software_project/main.dart';

class DioInterceptor extends Interceptor {
  final Box? tokens;
  final Dio? dio;

  DioInterceptor({
    this.tokens,
    this.dio,
  });

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print(options.uri);
    String? accessToken = Hive.box('tokens').get('access');

    if (accessToken != null) {
      options.baseUrl = Hive.box('tokens').get('url');
      if (!options.path.contains('signin') && !options.uri.toString().contains('auth/refresh')) {
        options.headers[HttpHeaders.authorizationHeader] = 'Bearer $accessToken';
      }
    }
    return handler.next(options);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      navigatorKey.currentState!.pushReplacementNamed('/auth');
    }
  }

  // @override
  // Future onError(DioError err, ErrorInterceptorHandler handler) async {
  //   // if (err.response?.statusCode == HttpStatus.unauthorized) {
  //   //   String refreshToken = tokens?.get('refresh');
  //   //
  //   //   if (refreshToken != null) {
  //   //       print('123');
  //   //       print(err.requestOptions.uri);
  //   //       print(refreshToken);
  //   //       await dio!.post('auth/refresh', data: {
  //   //         'refreshToken': refreshToken,
  //   //       }).then((value) async {
  //   //         print('skjbfsklgfkdsgbdkhgdbslfg');
  //   //         print(value.data);
  //   //         if (value.data['accessToken'] != null) {
  //   //           await tokens!.put('access', value.data['accessToken']);
  //   //           await tokens!.put('refresh', value.data['refreshToken']);
  //   //
  //   //           err.requestOptions.headers['Authorization'] =
  //   //               'Bearer ' + tokens!.get('access');
  //   //           final opts = new Options(
  //   //               method: err.requestOptions.method,
  //   //               headers: err.requestOptions.headers);
  //   //           final cloneReq = await dio!.request(err.requestOptions.path,
  //   //               options: opts,
  //   //               data: err.requestOptions.data,
  //   //               queryParameters: err.requestOptions.queryParameters);
  //   //           return handler.resolve(cloneReq);
  //   //         } else {
  //   //           tokens!.clear();
  //   //           navigatorKey.currentState!.pushReplacementNamed('/auth');
  //   //         }
  //   //         });
  //   //   }
  //   // }
  //   // super.onError(err, handler);
  //   if (err.response?.statusCode == HttpStatus.unauthorized) {
  //     String refreshToken = tokens?.get('refresh');
  //     print(refreshToken);
  //     try {
  //       await dio!.post(
  //           'auth/refresh', data: {
  //               'refreshToken': refreshToken,
  //           })
  //           .then((value) async {
  //         dio!.interceptors.requestLock.lock();
  //         dio!.interceptors.errorLock.lock();
  //         dio!.interceptors.responseLock.lock();
  //             print(value.statusCode);
  //         if (value.statusCode == HttpStatus.ok) {
  //           print('-------------');
  //           print(refreshToken);
  //           await tokens!.put('access', value.data['accessToken']);
  //           await tokens!.put('refresh', value.data['refreshToken']);
  //           print(tokens?.get('refresh'));
  //           print('-------------');
  //           err.requestOptions.headers["Authorization"] =
  //               "Bearer " + value.data['accessToken'];
  //           //create request with new access token
  //           final opts = new Options(
  //               method: err.requestOptions.method,
  //               headers: err.requestOptions.headers);
  //           final cloneReq = await dio!.request(err.requestOptions.path,
  //               options: opts,
  //               data: err.requestOptions.data,
  //               queryParameters: err.requestOptions.queryParameters);
  //           dio!.interceptors.requestLock.unlock();
  //           dio!.interceptors.errorLock.unlock();
  //           dio!.interceptors.responseLock.unlock();
  //           return handler.resolve(cloneReq);
  //         } else {
  //           dio!.interceptors.requestLock.unlock();
  //           dio!.interceptors.errorLock.unlock();
  //           dio!.interceptors.responseLock.unlock();
  //           tokens!.clear();
  //           navigatorKey.currentState!.pushReplacementNamed('/auth');
  //         }
  //       });
  //       return dio;
  //     } on DioError catch (e) {
  //       throw(e);
  //       if(e.response!.statusCode == 400) {
  //         tokens!.clear();
  //         navigatorKey.currentState!.pushReplacementNamed('/auth');
  //       }
  //     }
  //   }
  // }
}
