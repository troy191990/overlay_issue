import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:example/bloc/login/login_bloc.dart';
import 'package:example/ui/pages/baseScreen.dart';
import 'package:example/ui/widgets/generic/customLoader.dart';
import 'package:example/ui/widgets/login/loginWidget.dart';
import 'package:example/util/styles.dart';
import 'package:example/views/loginVM.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  var _loginModel = LoginVM(api: loginBloc);
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    return buildUi(context);
  }

  Widget buildUi(context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Styles.lightGrey,
        title: Text("Back"),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        color: Styles.darkBlue,
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: LoaderOverlay(
                    overlayWidget: Center(
                      child: CustomLoader(),
                    ),
                    useDefaultLoading: false,
                    overlayOpacity: 0.5,
                    overlayColor: Color.fromRGBO(23, 36, 42, 1.0),
                    child: BaseScreen<LoginVM>(
                        model: _loginModel,
                        onModelReady: (model) => model.init(),
                        builder: (ctx, model, child) {
                          _context = ctx;
                          return getWidget(model);
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _login(String username, String password) async {
    _context.showLoaderOverlay();
    await _loginModel.login(username, password);

    _context.hideLoaderOverlay();
  }

  Widget getWidget(LoginVM model) {
    return model.busy
        ? Card(
            color: Styles.darkBlue,
            child: LoginWidget(
              onPressed: _login,
            ),
          )
        : Card(
            color: Styles.darkBlue,
            child: LoginWidget(
              onPressed: _login,
            ),
          );
  }
}
