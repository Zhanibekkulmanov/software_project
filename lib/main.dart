import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:software_project/core/const/color_styles.dart';
import 'package:software_project/presentation/auth/pages/auth_screen.dart';
import 'package:software_project/presentation/main/pages/main_screen.dart';
import 'package:software_project/presentation/schedule/pages/schedule_screen.dart';
import 'package:software_project/presentation/visitTime/pages/visit_time_screen.dart';
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

  final Box tokensBox = Hive.box('tokens');

  //
  // int _selectedIndex = 0;
  // List<Widget> screens = [
  //   MainScreen(),
  //   MainScreen(),
  // ];
  //
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

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
          home: tokensBox.containsKey('access')
              ? MyStatefulWidget()
              : AuthScreen()
        // box.containsKey('show') ? AuthScreen() : IntroScreen()
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  int _selectedIndex = 0;
  List<Widget> screens = [
    MainScreen(),
    Schedule(),
    VisitTime(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorStyles.greyPageColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_contact_calendar_outlined,color: ColorStyles.greenIconColor,),
            label: 'Profile',
            backgroundColor: Color(0xff322C54),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined,color: ColorStyles.greenIconColor,),
            label: 'Schedule',
            backgroundColor: Color(0xff322C54),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule_outlined,color: ColorStyles.greenIconColor,),
            label: 'Visit time',
            backgroundColor: Color(0xff322C54),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}


