import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:example/ui/pages/baseEmptyPage.dart';
import 'package:example/ui/pages/loginPage.dart';
import 'package:example/util/routing/route_paths.dart' as routes;

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.LoginRoute:
      return CupertinoPageRoute(
          settings: RouteSettings(name: "/login"),
          builder: (context) => LoginPage());
    default:
      return CupertinoPageRoute(builder: (context) => BaseEmptyPage());
  }
}
