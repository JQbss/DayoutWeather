import 'package:dayout_weather/core/network/safe_api_call.dart';
import 'package:dayout_weather/data/models/remote/response/weather/weather_response_dto.dart';
import 'package:dayout_weather/data/data_sources/remote/weather_remote_data_source.dart';
import 'package:dayout_weather/data/mappers/weather_mapper.dart';
import 'package:dayout_weather/data/models/remote/request/weather_request_dto.dart';
import 'package:dayout_weather/domain/entities/weather_reading.dart';
import 'package:dayout_weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl with SafeApiCall implements IWeatherRepository {
  final WeatherRemoteDataSource _dataSource;

  WeatherRepositoryImpl({required WeatherRemoteDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<WeatherReading> fetchCurrent({
    required double lat,
    required double lon,
  }) =>
      safeCall(() async {
        final WeatherResponseDto response = await _dataSource.getCurrentWeather(
          WeatherRequestDto(latitude: lat, longitude: lon).toJson(),
        );
        return WeatherMapper.fromResponseDto(response);
      });
}
