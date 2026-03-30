import 'package:dayout_weather/domain/entities/weather_condition.dart';

class WeatherReading {
  final WeatherCondition condition;
  final double? temperature;
  final double? humidity;
  final double? windSpeed;
  final DateTime? time;

  WeatherReading({
    required this.condition,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.time,
  });
}
