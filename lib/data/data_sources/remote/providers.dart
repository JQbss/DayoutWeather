import 'package:dayout_weather/core/network/dio_provider.dart';
import 'package:dayout_weather/data/data_sources/remote/weather_remote_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<WeatherRemoteDataSource> weatherRemoteDataSourceProvider = Provider<WeatherRemoteDataSource>((ref) {
  final dio = ref.watch(openMeteoDioProvider);
  return WeatherRemoteDataSource(dio);
});
