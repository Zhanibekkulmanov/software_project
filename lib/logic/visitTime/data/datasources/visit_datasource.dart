
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

import '../../../../core/utils/dio/dio_wrapper.dart';

abstract class VisitTimeRemoteDataSource {
  Future<Response> getTime();
}

class VisitTimeRemoteDataSourceImpl implements VisitTimeRemoteDataSource {

  final DioWrapper? dioWrapper;

  VisitTimeRemoteDataSourceImpl({this.dioWrapper}) {
    dioWrapper?.path = '/time/';
  }

  @override
  Future<Response> getTokens(
      String username, String password) async {
    Response response = await Dio().post('https://yearsoul.pythonanywhere.com/api/login/',
        data: {
          'username': username,
          'password': password,
        });

    tokensBox.put('access', response.data['access']);

    return response;
  }

  final Box tokensBox = Hive.box('tokens');

  final dio = Dio();


  @override
  Future<Response> getTime() async {

    getTokens(Hive.box('tokens').get('login'), Hive.box('tokens').get('pass'));

    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["authorization"] = "Bearer ${tokensBox.get('access')}";

    print(Hive.box('tokens').get('access'));

    Response response = await dio.get('https://yearsoul.pythonanywhere.com/time/',);

    print(response.data);

    return response;
  }
}
