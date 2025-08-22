import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException DioException) {
    switch (DioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('Opps There was an Error, Please try again');
      case DioExceptionType.badResponse:
        return ServerFailure('Your request not found, Please try later!');
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceld');
      case DioExceptionType.connectionError:
        return ServerFailure('Internal Server error, Please try later');
      case DioExceptionType.unknown:
        return ServerFailure('No Internet Connection');

      //   return ServerFailure('Unexpected Error, Please try again!');
      // default:
      //   return ServerFailure('Opps There was an Error, Please try again');
    }
  }
}
