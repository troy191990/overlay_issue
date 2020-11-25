import 'package:flutter/material.dart';
import 'package:example/bloc/login/login_bloc.dart';
import 'package:example/model/login/auth_full_response.dart';
import 'package:example/util/routing/NavigationService.dart';
import 'package:example/util/routing/locator.dart';
import 'baseVM.dart';
import 'package:example/util/routing/route_paths.dart' as routes;

class LoginVM extends BaseVM {
  final NavigationService _navigationService = locator<NavigationService>();
  LoginBloc _api;
  LoginVM({
    @required LoginBloc api,
  }) : _api = api;

  AuthorizationFull auth;

  Future init() async {
    setBusy(true);
    auth = await _api.init();
    setBusy(false);
  }

  Future login(String email, String password) async {
    await new Future.delayed(const Duration(seconds: 5));
    setBusy(true);
    setError(false);
    try {
      auth = await _api.init();
      if (auth != null && auth.error != null && auth.error.isNotEmpty) {
        //setError(true);
      }
    } catch (ex) {
      print('ex $ex');
      //setError(true);
    } finally {
      setBusy(false);
    }
  }

  Future goToPage(String pageName) async {
    setBusy(true);
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
