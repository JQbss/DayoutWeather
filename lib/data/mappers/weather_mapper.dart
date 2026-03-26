import 'package:dayout_weather/data/models/remote/response/weather/weather_response_dto.dart';
import 'package:dayout_weather/domain/entities/weather_reading.dart';

class WeatherMapper {
  const WeatherMapper._();

  static WeatherReading fromResponseDto(WeatherResponseDto dto) {
    return WeatherReading(
      temperature: dto.current?.temperature,
      humidity: null,
      windSpeed: null,
      time: null,
    );
  }
}
