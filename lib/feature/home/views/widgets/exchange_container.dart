import 'dart:developer';

import 'package:exchange/core/utils/app_styles.dart';
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

  double fromValue = 1;
  String? toValue;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyCubit, CurrencyState>(
      builder: (context, state) {
        if (state is CurrencySuccess) {
          toHintText =
              (state.currency[state.toCurrency.split(" ").last] *
              fromValue /
              state.currency[state.fromCurrency.split(" ").last]);

          log(
            "form currency ${state.fromCurrency} , to currency ${state.toCurrency}",
          );
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
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
                      hintText: (toValue == null || toValue!.isEmpty)
                          ? "1.00"
                          : (state.currency[state.fromCurrency
                                        .split(" ")
                                        .last] *
                                    double.parse(toValue!) /
                                    state.currency[state.toCurrency
                                        .split(" ")
                                        .last])
                                .toStringAsFixed(2),

                      dropdownValue: state.fromCurrency,
                      ToOrFrom: false,
                      onChanged: (value) {
                        fromValue = double.parse(value == "" ? "1.00" : value);
                        setState(() {});
                      },
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [Divider(height: 130), ExchangeIcon()],
                    ),
                    ExchangeItem(
                      headerText: "Converted Amount",
                      hintText: toHintText.toStringAsFixed(2),
                      dropdownValue: state.toCurrency,
                      ToOrFrom: true,
                      onChanged: (value) {
                        if (value.isEmpty) {
                          toValue = null;
                        } else {
                          toValue = value;
                        }
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Indicative Exchange Rate",
                style: Styles.Reguler16(context),
              ),
              SizedBox(height: 10),
              Text(
                "1 ${state.fromCurrency.split(" ").last} = ${(state.currency[state.toCurrency.split(" ").last] / state.currency[state.fromCurrency.split(" ").last]).toStringAsFixed(3)} ${state.toCurrency.split(" ").last}",
                style: Styles.Mediume18(
                  context,
                ).copyWith(color: Color(0xff141414)),
              ),
            ],
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