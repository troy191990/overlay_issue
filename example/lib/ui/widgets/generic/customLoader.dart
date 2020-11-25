import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 80, width: 80, child: CircularProgressIndicator());
  }
}
