import 'package:exchange/core/utils/app_styles.dart';
import 'package:exchange/feature/home/views/widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';

class ExchangeItem extends StatelessWidget {
  const ExchangeItem({super.key, required this.headerText});
  final String headerText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(headerText, style: Styles.Reguler14(context)),
        Row(children: [CustomDropDown()]),
      ],
    );
  }
}
