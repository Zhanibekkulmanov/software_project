import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:software_project/core/routes/routes_const.dart';

import '../../presentation/main/pages/main_screen.dart';



class InnLabRouter {

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {

    final parts = routeSettings.name!.split('?');

    switch (parts[0]) {
      case MainRoute:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) => MainScreen(),
        );
      default:
        return CupertinoPageRoute(
          settings: routeSettings,
          builder: (_) =>
              CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: Text('Навигация'),
                ),
                child: Center(
                  child: Text(
                    'Ошибка, роут для ${routeSettings.name} не найден',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
        );
    }
  }
}
