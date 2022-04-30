import 'package:dio/dio.dart';

import '../datasources/auth_datasource.dart';
import '../models/auth_data_model.dart';

abstract class TokensRepository {
  Future<AuthDataModel> getTokens(String username, String password);

  void logOut();
}

class TokensRepositoryImpl implements TokensRepository {
  final TokensRemoteDataSource tokensRemoteDataSource;

  TokensRepositoryImpl(this.tokensRemoteDataSource);

  @override
  Future<AuthDataModel> getTokens(String username, String password) async {
    Response response = await tokensRemoteDataSource.getTokens(username, password);
    return AuthDataModel.fromJson(response.data);
  }

  @override
  void logOut() {
    // Hive.box('tokens').deleteAll(['access', 'refresh']);
  }
}
