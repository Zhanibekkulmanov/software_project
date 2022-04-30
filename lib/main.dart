import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:software_project/presentation/auth/pages/auth_screen.dart';
import 'core/indjection_container.dart';
import 'core/routes/router.dart';
import 'core/utils/hive/hive_init.dart';
import 'logic/auth/bloc/auth_bloc.dart';

void main() async {

  await Hive.initFlutter();
  initHiveAdapters();
  await initHiveBoxes();

  initGetIt();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final Box box = Hive.box('onBoarding');

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => sl(),
        ),
      ],
      child: MaterialApp(
          onGenerateRoute: (settings) => InnLabRouter.generateRoute(settings),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: AuthScreen()
        // box.containsKey('show') ? AuthScreen() : IntroScreen()
      ),
    );
  }
}

