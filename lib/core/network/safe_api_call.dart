import 'package:dayout_weather/core/errors/app_exception.dart';
import 'package:dayout_weather/core/extensions/dio_exception_mapper.dart';
import 'package:dio/dio.dart';

mixin SafeApiCall {
  Future<T> safeCall<T>(Future<T> Function() call) async {
    try {
      return await call();
    } on DioException catch (error) {
      throw error.toAppException();
    } catch (_) {
      throw const UnknownException();
    }
  }
}
