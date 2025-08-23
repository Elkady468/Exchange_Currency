part of 'currency_cubit.dart';

sealed class CurrencyState extends Equatable {
  const CurrencyState();

  @override
  List<Object> get props => [];
}

final class CurrencyInitial extends CurrencyState {}

final class CurrencySuccess extends CurrencyState {
  final Map<String, dynamic> currency;
  final String fromCurrency;
  final String toCurrency;
  const CurrencySuccess({
    required this.fromCurrency,
    required this.toCurrency,
    required this.currency,
  });

  CurrencySuccess copyWith({
    Map<String, dynamic>? currency,
    String? fromCurrency,
    String? toCurrency,
  }) {
    return CurrencySuccess(
      currency: currency ?? this.currency,
      fromCurrency: fromCurrency ?? this.fromCurrency,
      toCurrency: toCurrency ?? this.toCurrency,
    );
  }

  @override
  List<Object> get props => [currency, fromCurrency, toCurrency];
}

final class CurrencyLoading extends CurrencyState {}

final class CurrencyFailure extends CurrencyState {
  final String errMessage;

  const CurrencyFailure({required this.errMessage});
}
