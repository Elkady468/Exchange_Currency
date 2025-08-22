import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:exchange/core/error/failure.dart';
import 'package:exchange/core/utils/api_service.dart';
import 'package:exchange/feature/home/data/models/currency/conversion_rates.dart';
import 'package:exchange/feature/home/data/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<ConversionRates>>> getCurrency() async {
    try {
      List<ConversionRates> currency = [];
      var data = await apiService.get(endPoint: "ALL");

      currency.add(ConversionRates.fromJson(data["conversion_rates"]));

      return right(currency);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
