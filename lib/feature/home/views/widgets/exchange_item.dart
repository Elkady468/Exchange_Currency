import 'package:exchange/core/utils/app_styles.dart';
import 'package:exchange/feature/home/views/widgets/custom_drop_down.dart';
import 'package:exchange/feature/home/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ExchangeItem extends StatelessWidget {
  const ExchangeItem({
    super.key,
    required this.headerText,
    required this.hintText,
    required this.dropdownValue,
    required this.ToOrFrom,
  });
  final String headerText;
  final String hintText;
  final String dropdownValue;
  final bool ToOrFrom;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(headerText, style: Styles.Reguler14(context)),
        SizedBox(height: 8),
        Row(
          children: [
            CustomDropDown(dropdownValue: dropdownValue, toOrFrom: ToOrFrom),
            Spacer(),
            SizedBox(width: 125, child: CustomTextField(hintText: hintText)),
          ],
        ),
      ],
    );
  }
}
