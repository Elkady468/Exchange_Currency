import 'package:dartz/dartz.dart';
import 'package:exchange/core/error/failure.dart';
import 'package:exchange/feature/home/data/models/currency/conversion_rates.dart';

abstract class HomeRepo {
  Future<Either<Failure, Map<String, dynamic>>> getCurrency();
}
