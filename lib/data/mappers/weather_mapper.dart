import 'package:dayout_weather/data/models/remote/response/weather/weather_response_dto.dart';
import 'package:dayout_weather/domain/entities/weather_condition.dart';
import 'package:dayout_weather/domain/entities/weather_reading.dart';

class WeatherMapper {
  const WeatherMapper._();

  static WeatherReading fromResponseDto(WeatherResponseDto dto) {
    return WeatherReading(
      condition: _conditionFromWmoCode(dto.current?.weatherCode ?? 0),
      temperature: dto.current?.temperature,
      humidity: dto.current?.relativeHumidity?.toDouble(),
      windSpeed: dto.current?.windSpeed,
      time: null,
    );
  }

  /// Maps WMO weather interpretation codes to a [WeatherCondition].
  /// See: https://open-meteo.com/en/docs#weathervariables
  static WeatherCondition _conditionFromWmoCode(int code) {
    return switch (code) {
      0 => WeatherCondition.sunny,
      1 || 2 => WeatherCondition.partlyCloudy,
      3 => WeatherCondition.cloudy,
      45 || 48 => WeatherCondition.foggy,
      51 || 53 || 55 || 56 || 57 => WeatherCondition.drizzle,
      61 || 63 || 65 || 66 || 67 || 80 || 81 || 82 => WeatherCondition.rainy,
      71 || 73 || 75 || 77 || 85 || 86 => WeatherCondition.snowy,
      95 || 96 || 99 => WeatherCondition.thunderstorm,
      _ => WeatherCondition.cloudy,
    };
  }
}
