import 'package:dayout_weather/data/models/remote/response/weather/weather_response_dto.dart';
import 'package:dayout_weather/domain/entities/wather_reading.dart';

class WeatherMapper {
  WeatherReading fromResponseDto(WeatherResponseDto dto) {
    return WeatherReading(
      temperature: dto.current?.temperature,
      humidity: null,
      windSpeed: null,
      time: null,
    );
  }
}
