import 'package:json_annotation/json_annotation.dart';

part 'current_weather_dto.g.dart';

@JsonSerializable(createToJson: false)
class CurrentWeatherDto {
  @JsonKey(name: 'temperature_2m')
  final double? temperature;

  const CurrentWeatherDto({required this.temperature});

  factory CurrentWeatherDto.fromJson(Map<String, dynamic> json) => _$CurrentWeatherDtoFromJson(json);
}
