import 'package:dayout_weather/core/constants/weather_constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_request_dto.g.dart';

@JsonSerializable(createFactory: false)
class WeatherRequestDto {
  final double latitude;
  final double longitude;
  final String current;
  final String timezone;

  const WeatherRequestDto({
    required this.latitude,
    required this.longitude,
    this.current = WeatherConstants.currentParamsQuery,
    this.timezone = WeatherConstants.timezone,
  });

  Map<String, dynamic> toJson() => _$WeatherRequestDtoToJson(this);
}
