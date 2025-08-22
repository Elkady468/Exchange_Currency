import 'package:dartz/dartz.dart';
import 'package:exchange/core/error/failure.dart';
import 'package:exchange/feature/home/data/models/currency/conversion_rates.dart';
import 'package:exchange/feature/home/data/models/currency/currency.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ConversionRates>>> getCurrency();
}
