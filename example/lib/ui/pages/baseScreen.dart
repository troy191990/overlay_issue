import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class BaseScreen<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final T model;
  final Widget child;
  final Function(T) onModelReady;

  BaseScreen({Key key, this.builder, this.model, this.child, this.onModelReady})
      : super(key: key);

  _BaseScreenState<T> createState() => _BaseScreenState<T>();
}

class _BaseScreenState<T extends ChangeNotifier> extends State<BaseScreen<T>> {
  T model;

  @override
  void initState() {
    model = widget.model;

    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child == null ? Container() : widget.child,
      ),
    );
  }
}
