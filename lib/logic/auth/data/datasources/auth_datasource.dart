import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

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

  final Box tokensBox = Hive.box('tokens');

  @override
  Future<Response> getTokens(
      String username, String password) async {
    Response response = await Dio().post('https://yearsoul.pythonanywhere.com/api/login/',
        data: {
      'username': username,
      'password': password,
    });

    tokensBox.put('name', response.data['first-name']);
    tokensBox.put('id', response.data['user-id']);
    tokensBox.put('position', response.data['position']);
    tokensBox.put('birth-date', response.data['birth-date']);
    tokensBox.put('phone', response.data['phone']);
    tokensBox.put('gmail', response.data['gmail']);

    return response;
  }
}
