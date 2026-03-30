import 'package:dayout_weather/core/errors/app_exception.dart';
import 'package:dio/dio.dart';

extension DioExceptionMapper on DioException {
  AppException toAppException() {
    if (type == DioExceptionType.connectionError ||
        type == DioExceptionType.receiveTimeout ||
        type == DioExceptionType.connectionTimeout) {
      return const NetworkException();
    }
    return ServerException(message ?? '');
  }
}
