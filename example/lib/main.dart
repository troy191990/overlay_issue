import 'package:example/ui/pages/homePage.dart';
import 'package:example/util/routing/NavigationService.dart';
import 'package:example/util/routing/locator.dart';
import 'package:flutter/material.dart';
import 'package:example/util/routing/router.dart' as router;

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // splash screen
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example App',
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: router.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: HomePage(),
    );
  }
}
