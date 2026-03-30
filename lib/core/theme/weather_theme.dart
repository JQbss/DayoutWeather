import 'package:dayout_weather/core/theme/weather_theme_data.dart';
import 'package:flutter/material.dart';

class WeatherTheme extends InheritedWidget {
  final WeatherThemeData data;

  const WeatherTheme({super.key, required this.data, required super.child});

  static WeatherThemeData of(BuildContext context) {
    final WeatherThemeData? data = context.dependOnInheritedWidgetOfExactType<WeatherTheme>()?.data;

    if (data == null) {
      return const WeatherThemeData.sunny();
    }

    return data;
  }

  @override
  bool updateShouldNotify(WeatherTheme old) => data != old.data;
}
