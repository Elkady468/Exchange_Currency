import 'package:exchange/feature/home/views/widgets/excgange_icon.dart';
import 'package:exchange/feature/home/views/widgets/exchange_item.dart';
import 'package:flutter/material.dart';

class ExchangeContainer extends StatelessWidget {
  const ExchangeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 48, horizontal: 32),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
      ),
      child: Column(
        children: [
          ExchangeItem(
            headerText: "Amount",
            hintText: "1.00",
            dropdownValue: "🇪🇬 EGP",
          ),
          Stack(
            alignment: Alignment.center,
            children: [Divider(height: 130), ExcgangeIcon()],
          ),
          ExchangeItem(
            headerText: "Converted Amount",
            hintText: "",
            dropdownValue: "🇺🇸 USD",
          ),
        ],
      ),
    );
  }
}
