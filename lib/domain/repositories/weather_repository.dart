import 'package:dayout_weather/domain/entities/wather_reading.dart';

abstract interface class IWeatherRepository {
  Future<WeatherReading> fetchCurrent();
}
