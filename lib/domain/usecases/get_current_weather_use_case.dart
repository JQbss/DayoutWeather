import 'package:dayout_weather/domain/repositories/weather_repository.dart';

import '../entities/weather_reading.dart';

class GetCurrentWeatherUseCase {
  final IWeatherRepository _repository;

  const GetCurrentWeatherUseCase({required IWeatherRepository repository})
      : _repository = repository;

  Future<WeatherReading> call({required double lat, required double lon}) {
    return _repository.fetchCurrent(lat: lat, lon: lon);
  }
}
