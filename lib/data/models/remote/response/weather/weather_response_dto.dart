import 'package:dayout_weather/data/models/remote/response/weather/current_weather_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_response_dto.g.dart';

@JsonSerializable(createToJson: false)
class WeatherResponseDto {
  final CurrentWeatherDto? current;

  const WeatherResponseDto({required this.current});

  factory WeatherResponseDto.fromJson(Map<String, dynamic> json) => _$WeatherResponseDtoFromJson(json);
}
