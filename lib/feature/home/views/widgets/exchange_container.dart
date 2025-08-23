import 'dart:developer';

import 'package:exchange/feature/home/presentation/manager/currency_cubit/currency_cubit.dart';
import 'package:exchange/feature/home/views/widgets/excgange_icon.dart';
import 'package:exchange/feature/home/views/widgets/exchange_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExchangeContainer extends StatefulWidget {
  ExchangeContainer({super.key});

  @override
  State<ExchangeContainer> createState() => _ExchangeContainerState();
}

class _ExchangeContainerState extends State<ExchangeContainer> {
  double toHintText = .055;
  double fromHintText = 1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyCubit, CurrencyState>(
      builder: (context, state) {
        if (state is CurrencySuccess) {
          toHintText =
              (state.currency[state.toCurrency.split(" ").last] *
              1 /
              state.currency[state.fromCurrency.split(" ").last]);
          log(
            "form currency ${state.fromCurrency} , to currency ${state.toCurrency}",
          );
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
                  hintText: fromHintText.toStringAsFixed(2),
                  dropdownValue: state.fromCurrency,
                  ToOrFrom: false,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [Divider(height: 130), ExcgangeIcon()],
                ),
                ExchangeItem(
                  headerText: "Converted Amount",
                  hintText: toHintText.toStringAsFixed(2),
                  dropdownValue: state.toCurrency,
                  ToOrFrom: true,
                ),
              ],
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}




        // if (state is CurrencySuccess) {
        //   String fromCurrency = context.read<CurrencyCubit>().fromCurrency;
        //   String toCurrency = context.read<CurrencyCubit>().toCurrency;
        //   setState(() {});
        //   log("form currency $fromCurrency , to currency $toCurrency");
        //   toHintText =
        //       (state.currency[fromCurrency] * 1 / state.currency[toCurrency]);
        //   setState(() {});
        //   log(toHintText.toString());
        // } else if (state is CurrencyFailure) {
        //   log(state.errMessage);
        // }