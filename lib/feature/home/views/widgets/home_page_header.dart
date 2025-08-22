import 'package:exchange/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text("Currency Converter", style: Styles.Mediume20(context))],
    );
  }
}
