// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherDto _$CurrentWeatherDtoFromJson(Map<String, dynamic> json) =>
    CurrentWeatherDto(
      temperature: (json['temperature_2m'] as num?)?.toDouble(),
      relativeHumidity: (json['relative_humidity_2m'] as num?)?.toInt(),
      windSpeed: (json['wind_speed_10m'] as num?)?.toDouble(),
      weatherCode: (json['weather_code'] as num?)?.toInt(),
    );
