import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exchange/feature/home/data/models/currency/conversion_rates.dart';
import 'package:exchange/feature/home/data/repo/home_repo.dart';

part 'currency_state.dart';

class CurrencyCubit extends Cubit<CurrencyState> {
  CurrencyCubit(this.homeRepo) : super(CurrencyInitial());
  final HomeRepo homeRepo;

  String fromCurrency = "🇺🇸 USD";
  String toCurrency = "🇪🇬 EGP";
  Future<void> getCurrency() async {
    var result = await homeRepo.getCurrency();
    result.fold(
      (failure) {
        emit(CurrencyFailure(errMessage: failure.errMessage));
      },
      (currencyMap) {
        emit(
          CurrencySuccess(
            currency: currencyMap,
            fromCurrency: fromCurrency,
            toCurrency: toCurrency,
          ),
        );
        print(currencyMap);
      },
    );
  }

  void setFromCurrency(String code) {
    fromCurrency = code;
    if (state is CurrencySuccess) {
      emit((state as CurrencySuccess).copyWith(fromCurrency: code));
    }
  }

  void setToCurrency(String code) {
    toCurrency = code;
    if (state is CurrencySuccess) {
      emit((state as CurrencySuccess).copyWith(toCurrency: code));
    }
  }
}
