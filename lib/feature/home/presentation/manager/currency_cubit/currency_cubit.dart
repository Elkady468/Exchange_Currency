import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exchange/feature/home/data/models/currency/conversion_rates.dart';
import 'package:exchange/feature/home/data/repo/home_repo.dart';

part 'currency_state.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  CurrencyCubit(this.homeRepo) : super(CurrencyInitial());
  final HomeRepo homeRepo;
  Future<void> getCurrency() async {
    var result = await homeRepo.getCurrency();
    result.fold(
      (failure) {
        emit(CurrencyFailure(errMessage: failure.errMessage));
      },
      (currencyList) {
        emit(CurrencySuccess(currency: currencyList));
        print(currencyList);
      },
    );
  }
}
