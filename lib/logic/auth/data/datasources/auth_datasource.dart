import 'package:dio/dio.dart';

import '../../../../core/utils/dio/dio_wrapper.dart';

abstract class TokensRemoteDataSource {
  Future<Response> getTokens(
      String username, String password);

}

class TokensRemoteDataSourceImpl implements TokensRemoteDataSource {
  // final DioWrapper? dioWrapper;

  // TokensRemoteDataSourceImpl({this.dioWrapper}) {
  //   dioWrapper?.path = '';
  // }

  @override
  Future<Response> getTokens(
      String username, String password) async {
    Response response = await Dio().post('https://yearsoul.pythonanywhere.com/api/login/',
        data: {
      'username': username,
      'password': password,
    });

    return response;
  }
}
