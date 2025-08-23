import 'package:exchange/feature/home/views/widgets/exchange_item.dart';
import 'package:flutter/material.dart';

class ExchangeContainer extends StatelessWidget {
  const ExchangeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
      ),
      child: ExchangeItem(headerText: "Amount"),
    );
  }
}
