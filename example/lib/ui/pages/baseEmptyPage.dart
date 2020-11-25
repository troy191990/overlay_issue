import 'package:example/util/styles.dart';
import 'package:flutter/material.dart';

class BaseEmptyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.lightGrey,
        title: Text("Back"),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.amber,
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Text("this is our base page"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
