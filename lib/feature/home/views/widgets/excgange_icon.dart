import 'package:flutter/material.dart';

class ExcgangeIcon extends StatelessWidget {
  const ExcgangeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90),
        color: Color(0xff26278D),
      ),
      child: Icon(
        Icons.currency_exchange_outlined,
        color: Colors.white,
        size: 32,
      ),
    );
  }
}
