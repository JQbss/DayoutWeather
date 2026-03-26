class WeatherConstants {
  WeatherConstants._();

  static const List<String> currentParams = [
    'temperature_2m',
    'relative_humidity_2m',
    'wind_speed_10m',
    'weather_code',
  ];

  static const String currentParamsQuery = 'temperature_2m,relative_humidity_2m,wind_speed_10m,weather_code';

  static const String timezone = 'auto';
}
