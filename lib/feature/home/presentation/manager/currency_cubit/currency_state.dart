part of 'currency_cubit.dart';

sealed class CurrencyState extends Equatable {
  const CurrencyState();

  @override
  List<Object> get props => [];
}

final class CurrencyInitial extends CurrencyState {}

final class CurrencySuccess extends CurrencyState {
  final List<ConversionRates> currency;

  const CurrencySuccess({required this.currency});
  @override
  List<Object> get props => [currency];
}

final class CurrencyLoading extends CurrencyState {}

final class CurrencyFailure extends CurrencyState {
  final String errMessage;

  const CurrencyFailure({required this.errMessage});
}
