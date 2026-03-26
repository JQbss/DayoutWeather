import 'package:dayout_weather/domain/entities/weather_reading.dart';

abstract interface class IWeatherRepository {
  Future<WeatherReading> fetchCurrent({required double lat, required double lon});
}
