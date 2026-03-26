import 'package:json_annotation/json_annotation.dart';

part 'current_weather_dto.g.dart';

@JsonSerializable(createToJson: false)
class CurrentWeatherDto {
  @JsonKey(name: 'temperature_2m')
  final double? temperature;

  @JsonKey(name: 'relative_humidity_2m')
  final int? relativeHumidity;

  @JsonKey(name: 'wind_speed_10m')
  final double? windSpeed;

  @JsonKey(name: 'weather_code')
  final int? weatherCode;

  const CurrentWeatherDto({
    required this.temperature,
    required this.relativeHumidity,
    required this.windSpeed,
    required this.weatherCode,
  });

  factory CurrentWeatherDto.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherDtoFromJson(json);
}
