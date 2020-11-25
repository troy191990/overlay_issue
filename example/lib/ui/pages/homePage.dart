import 'package:example/ui/widgets/generic/customLoader.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:example/bloc/homeOption/home_bloc.dart';
import 'package:example/model/homeOption/homeOption.dart';
import 'package:example/ui/pages/baseScreen.dart';
import 'package:example/ui/widgets/generic/globalError.dart';
import 'package:example/ui/widgets/homeOtions/homeOptionsWidget.dart';
import 'package:example/util/styles.dart';
import 'package:example/views/homeVM.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({Key key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  BuildContext _context;

  var _homeModel = HomeVM(api: homeBloc);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.darkBlue,
        title: Text("Example "),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      key: _scaffoldKey,
      body: Container(
        color: Styles.lightGrey,
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
                    child: BaseScreen<HomeVM>(
                        model: _homeModel,
                        onModelReady: (model) => model.getHomeOptions("home"),
                        builder: (context, model, child) {
                          _context = context;
                          if (model.apiError) {
                            context.hideLoaderOverlay();
                            return GlobalError(
                              errorText: model.homeOptions.error,
                              onPressed: _retry,
                            );
                          } else
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

  _retry() {
    _homeModel.getHomeOptions("home");
  }

  Widget getWidget(HomeVM model) {
    List<HomeOption> empty = new List<HomeOption>();
    if (model.busy) {
      _context.showLoaderOverlay();
      return HomeOptionsWidget(
        model: model,
        options: model.homeOptions == null
            ? empty
            : model.homeOptions.options.options,
      );
    } else {
      _context.hideLoaderOverlay();
      return HomeOptionsWidget(
        model: model,
        options: model.homeOptions == null
            ? Text("An error has occurred contacting the server11")
            : model.homeOptions.options.options,
      );
    }
  }
}
