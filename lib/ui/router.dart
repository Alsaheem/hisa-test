import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealsapp/ui/views/mainview.dart';
import '../core/constants/app_constants.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    debugPrint(settings.name);
    switch (settings.name) {
      case RoutePaths.HomeTab:
        return _getPageRoute(
            view: MyHomePage(),
            routeName: settings.name,
            args: settings.arguments);
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

PageRoute<dynamic> _getPageRoute({String routeName, Widget view, Object args}) {
  return CupertinoPageRoute<dynamic>(
      settings: RouteSettings(name: routeName, arguments: args),
      builder: (_) => view);
}
