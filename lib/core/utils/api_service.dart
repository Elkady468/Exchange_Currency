import 'package:dio/dio.dart';

class ApiService {
  ApiService(this._dio);

  final Dio _dio;

  final String basrUrl =
      "https://v6.exchangerate-api.com/v6/b923f696585753515bbd2dcc/latest/";

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get("$basrUrl$endPoint");

    return response.data;
  }
}
