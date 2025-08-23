import 'package:flutter/material.dart';

class ExchangeIcon extends StatelessWidget {
  const ExchangeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90),
        color: Color(0xff26278D),
      ),
      child: Icon(Icons.swap_vert, color: Colors.white, size: 32),
    );
  }
}
