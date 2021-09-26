import "package:first_flutter_app/about.dart";
import 'package:first_flutter_app/home.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  //配置路由
  static final routes = {
    "/": (context, {arguments}) => MyHomePage(title: '画廊'),
    "/about": (context, {arguments}) => About(),
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final String name = settings.name;
    final Function pageContentBuilder = routes[name];
    if (pageContentBuilder != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      return _errorPage('找不到页面');
    }
  }

  static Route _errorPage(msg) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
          appBar: AppBar(title: Text('未知页面')), body: Center(child: Text(msg)));
    });
  }
}
