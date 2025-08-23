import 'package:exchange/feature/home/views/widgets/exchange_container.dart';
import 'package:exchange/feature/home/views/widgets/home_page_header.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 90),
            HomePageHeader(),
            SizedBox(height: 90),
            ExchangeContainer(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
