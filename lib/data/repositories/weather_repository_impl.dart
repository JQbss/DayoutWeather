import 'package:dayout_weather/core/errors/app_exception.dart';
import 'package:dayout_weather/data/data_sources/remote/weather_remote_data_source.dart';
import 'package:dayout_weather/data/mappers/weather_mapper.dart';
import 'package:dayout_weather/data/models/remote/request/weather_request_dto.dart';
import 'package:dayout_weather/domain/entities/weather_reading.dart';
import 'package:dayout_weather/domain/repositories/weather_repository.dart';
import 'package:dio/dio.dart';

class WeatherRepositoryImpl implements IWeatherRepository {
  final WeatherRemoteDataSource _dataSource;

  WeatherRepositoryImpl({required WeatherRemoteDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<WeatherReading> fetchCurrent({
    required double lat,
    required double lon,
  }) async {
    try {
      final request = WeatherRequestDto(latitude: lat, longitude: lon);
      print('[WeatherRepo] Sending request: ${request.toJson()}');
      final response = await _dataSource.getCurrentWeather(request.toJson());
      print('[WeatherRepo] Got response: $response');
      final mapped = WeatherMapper.fromResponseDto(response);
      print('[WeatherRepo] Mapped to: $mapped');
      return mapped;
    } on DioException catch (e) {
      print('[WeatherRepo] DioException: ${e.type} — ${e.message}');
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionTimeout) {
        throw const NetworkException();
      }
      throw ServerException(e.message ?? 'Server error.');
    } catch (e) {
      print('[WeatherRepo] UnknownException: $e');
      throw const UnknownException();
    }
  }
}
