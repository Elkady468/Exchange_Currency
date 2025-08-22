import 'package:exchange/core/utils/service_locator.dart';
import 'package:exchange/feature/home/data/repo/home_repo_impl.dart';
import 'package:exchange/feature/home/presentation/manager/currency_cubit/currency_cubit.dart';
import 'package:exchange/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const ExchangeCurrency());
  Setup();
  Bloc.observer = SimpleBlocObserver();
}

class ExchangeCurrency extends StatelessWidget {
  const ExchangeCurrency({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CurrencyCubit(getIt.get<HomeRepoImpl>())..getCurrency(),
      child: MaterialApp(
        home: Scaffold(
          body: BlocBuilder<CurrencyCubit, CurrencyState>(
            builder: (context, state) {
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
