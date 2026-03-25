import 'package:json_annotation/json_annotation.dart';

part 'weather_request_dto.g.dart';

@JsonSerializable(createFactory: false)
class WeatherRequestDto {
  final double latitude;
  final double longitude;

  const WeatherRequestDto({
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toJson() => _$WeatherRequestDtoToJson(this);
}