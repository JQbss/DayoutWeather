import 'package:dayout_weather/domain/entities/weather_condition.dart';
import 'package:flutter/material.dart';

@immutable
class WeatherThemeData {
  final List<Color> backgroundGradient;
  final Color cardColor;

  const WeatherThemeData({
    required this.backgroundGradient,
    required this.cardColor,
  });

  const WeatherThemeData.sunny()
      : backgroundGradient = const [Color(0xFFFFB74D), Color(0xFFFFF9C4)],
        cardColor = const Color(0xFFFFF8E1);

  const WeatherThemeData.partlyCloudy()
      : backgroundGradient = const [Color(0xFF64B5F6), Color(0xFFE3F2FD)],
        cardColor = const Color(0xFFE3F2FD);

  const WeatherThemeData.cloudy()
      : backgroundGradient = const [Color(0xFF90A4AE), Color(0xFFECEFF1)],
        cardColor = const Color(0xFFECEFF1);

  const WeatherThemeData.foggy()
      : backgroundGradient = const [Color(0xFFBDBDBD), Color(0xFFF5F5F5)],
        cardColor = const Color(0xFFF5F5F5);

  const WeatherThemeData.drizzle()
      : backgroundGradient = const [Color(0xFF4FC3F7), Color(0xFFB3E5FC)],
        cardColor = const Color(0xFFE1F5FE);

  const WeatherThemeData.rainy()
      : backgroundGradient = const [Color(0xFF1565C0), Color(0xFF42A5F5)],
        cardColor = const Color(0xFF1E88E5);

  const WeatherThemeData.snowy()
      : backgroundGradient = const [Color(0xFFB3E5FC), Color(0xFFE1F5FE)],
        cardColor = const Color(0xFFE1F5FE);

  const WeatherThemeData.thunderstorm()
      : backgroundGradient = const [Color(0xFF311B92), Color(0xFF4A148C)],
        cardColor = const Color(0xFF4527A0);

  const WeatherThemeData.night()
      : backgroundGradient = const [Color(0xFF0D0D2B), Color(0xFF1A237E)],
        cardColor = const Color(0xFF283593);

  factory WeatherThemeData.fromCondition(WeatherCondition condition) {
    return switch (condition) {
      WeatherCondition.sunny => const WeatherThemeData.sunny(),
      WeatherCondition.partlyCloudy => const WeatherThemeData.partlyCloudy(),
      WeatherCondition.cloudy => const WeatherThemeData.cloudy(),
      WeatherCondition.foggy => const WeatherThemeData.foggy(),
      WeatherCondition.drizzle => const WeatherThemeData.drizzle(),
      WeatherCondition.rainy => const WeatherThemeData.rainy(),
      WeatherCondition.snowy => const WeatherThemeData.snowy(),
      WeatherCondition.thunderstorm => const WeatherThemeData.thunderstorm(),
      WeatherCondition.night => const WeatherThemeData.night(),
    };
  }

}
