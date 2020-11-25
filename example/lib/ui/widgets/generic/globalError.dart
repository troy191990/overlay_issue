import 'package:flutter/material.dart';
import 'package:example/util/styles.dart';

class GlobalError extends StatelessWidget {
  const GlobalError({Key key, this.errorText, this.onPressed})
      : super(key: key);
  final String errorText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Styles.lightGrey,
        child: SafeArea(
          child: Card(
              color: Styles.darkBlue,
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 24.0, right: 24.0),
                  children: <Widget>[
                    SizedBox(height: 5.0),
                    Center(
                      child: Text("An error has occurred:"),
                    ),
                    SizedBox(height: 5.0),
                    Center(
                      child: Text(errorText),
                    ),
                    SizedBox(height: 5.0),
                    onPressed == null
                        ? Container()
                        : Center(
                            child: MaterialButton(
                              onPressed: onPressed,
                              child: Text("Retry"),
                            ),
                          ),
                    SizedBox(height: 15.0),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
