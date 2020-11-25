import 'package:flutter/material.dart';
import 'package:example/bloc/homeOption/home_bloc.dart';
import 'package:example/model/homeOption/home_option_full_response.dart';
import 'package:example/util/routing/NavigationService.dart';
import 'package:example/util/routing/locator.dart';
import 'package:example/util/routing/route_paths.dart' as routes;
import 'package:example/views/baseVM.dart';

class HomeVM extends BaseVM {
  final NavigationService _navigationService = locator<NavigationService>();
  HomeBloc _api;

  HomeVM({@required HomeBloc api}) : _api = api;

  HomeOptionFull homeOptions;

  Future init() async {}

  Future getHomeOptions(String pageName) async {
    setBusy(true);
    await new Future.delayed(const Duration(seconds: 3));
    setError(false);

    try {
      switch (pageName.toLowerCase()) {
        case "home":
          homeOptions = await _api.getHomeOptions();
          if (homeOptions != null &&
              homeOptions.error != null &&
              homeOptions.error.isNotEmpty) {
            setError(true);
          }
          break;
      }
    } catch (ex) {
      print('ex $ex');
      setError(true);
    } finally {
      setBusy(false);
    }
  }

  Future goToPage(String pageName) async {
    setBusy(true);
    await new Future.delayed(const Duration(seconds: 2));
    switch (pageName.toLowerCase()) {
      case "login":
        _navigationService.navigateTo(routes.LoginRoute);
        break;
      default:
        _navigationService.navigateTo(routes.BaseEmptyRoute, arguments: "test");
        break;
    }
    setBusy(false);
  }
}
