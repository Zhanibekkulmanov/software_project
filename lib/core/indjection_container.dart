import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:software_project/core/utils/dio/dio_interceptor.dart';
import 'package:software_project/core/utils/dio/dio_wrapper.dart';
import 'package:software_project/logic/visitTime/bloc/visit_time_bloc.dart';
import 'package:software_project/logic/visitTime/data/repositories/visit_repository.dart';

import '../logic/auth/bloc/auth_bloc.dart';
import '../logic/auth/data/datasources/auth_datasource.dart';
import '../logic/auth/data/repositories/auth_repository.dart';
import '../logic/visitTime/data/datasources/visit_datasource.dart';

var sl = GetIt.instance;

Future<void> initGetIt() async {
  Box tokensBox = Hive.box('tokens');
  // DIO RELATED STAFF
  sl.registerFactory<Dio>(
        () => Dio(BaseOptions(baseUrl: 'https://yearsoul.pythonanywhere.com/')),
  );

  sl.registerLazySingleton<DioInterceptor>(
        () => DioInterceptor(tokens: tokensBox, dio: sl()),
  );

  sl.registerFactory<DioWrapper>(
        () => DioWrapper(sl(), sl()),
  );

  sl.registerLazySingleton<TokensRemoteDataSource>(
        () => TokensRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<TokensRepository>(
        () => TokensRepositoryImpl(sl()),
  );

  sl.registerFactory<AuthBloc>(
        () => AuthBloc(sl()),
  );

  sl.registerLazySingleton<VisitTimeRemoteDataSource>(
        () => VisitTimeRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<VisitTimeRepository>(
        () => VisitTimeRepositoryImpl(sl()),
  );

  sl.registerFactory<VisitTimeBloc>(
        () => VisitTimeBloc(sl()),
  );
}