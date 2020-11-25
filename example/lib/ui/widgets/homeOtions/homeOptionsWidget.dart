import 'package:flutter/material.dart';
import 'package:example/model/homeOption/homeOption.dart';
import 'package:example/ui/widgets/homeOtions/optionCard.dart';
import 'package:example/views/homeVM.dart';

class HomeOptionsWidget extends StatelessWidget {
  const HomeOptionsWidget({Key key, this.options, this.model})
      : super(key: key);
  final List<HomeOption> options;
  final HomeVM model;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(options.length, (index) {
        return Center(
          child: OptionCard(
              option: options[index],
              onTapTempusNavigationCallback: handleTap,
              model: model),
        );
      }),
    );
  }

  handleTap(HomeOption selectedOption) async {
    model.goToPage(selectedOption.pageName);
  }
}
