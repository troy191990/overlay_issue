import 'package:flutter/material.dart';
import 'package:example/util/functions.dart';
import 'package:example/util/styles.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key key, @required this.onPressed}) : super(key: key);
  final LoginVoidFunc onPressed;

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          Text("Error occurs when you pop back to the previous screen"),
          SizedBox(height: 12.0),
          buildButton(),
          SizedBox(height: 5.0),
        ],
      ),
    );
  }

  Widget buildButton() {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Material(
        borderRadius: BorderRadius.circular(40.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: Container(
            margin:
                EdgeInsets.only(top: 4.0, bottom: 4.0, left: 4.0, right: 4.0),
            padding: EdgeInsets.all(0.0),
            decoration: BoxDecoration(
                color: Styles.darkBlue,
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: RawMaterialButton(
              padding: EdgeInsets.all(0.0),
              elevation: 0.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Show Loader", style: TextStyle(color: Colors.white)),
                ],
              ),
              onPressed: () async {
                widget.onPressed("test", "test");
              },
            )),
      ),
    );
  }
}
