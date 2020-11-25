import 'package:flutter/material.dart';
import 'package:example/model/homeOption/homeOption.dart';
import 'package:example/util/functions.dart';
import 'package:example/util/styles.dart';
import 'package:example/views/homeVM.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    Key key,
    @required this.option,
    @required this.onTapTempusNavigationCallback,
    @required this.model,
  }) : super(key: key);
  final HomeOption option;
  final WidgetVoidFunc onTapTempusNavigationCallback;
  final HomeVM model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTapTempusNavigationCallback(option);
        },
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              child: ContentItem(
                textOne: this.option.textOne,
                textTwo: this.option.textTwo,
                icon: Icon(
                  IconData(int.parse(this.option.iconCode),
                      fontFamily: 'MaterialIcons'),
                  size: 70,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ));
  }
}

class ContentItem extends StatelessWidget {
  final Icon icon;
  final String textOne;
  final String textTwo;

  const ContentItem({Key key, this.icon, this.textOne, this.textTwo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 1.0, bottom: 1.0),
        child: Card(
            color: Styles.darkBlue,
            child: Center(
              child: Column(children: <Widget>[
                Expanded(
                    flex: this.textTwo.length > 0 ? 5 : 7,
                    child: Container(
                      child: this.icon,
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      child: Text(this.textOne,
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.0)),
                    )),
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        child: Text(this.textTwo,
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0)),
                      ),
                    )),
              ]),
            )),
      ),
    );
  }
}
