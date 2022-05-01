import 'package:dio/dio.dart';

import '../datasources/visit_datasource.dart';
import '../models/visit_models.dart';

abstract class VisitTimeRepository {
  Future<List<VisitTimeModel>> getTime();

}

class VisitTimeRepositoryImpl implements VisitTimeRepository {
  final VisitTimeRemoteDataSource tokensRemoteDataSource;

  VisitTimeRepositoryImpl(this.tokensRemoteDataSource);

  @override
  Future<List<VisitTimeModel>> getTime() async {
    Response response = await tokensRemoteDataSource.getTime();

    return (response.data as List).map((object) => VisitTimeModel.fromJson(object)).toList();
  }

}
