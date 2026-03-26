import 'package:dayout_weather/data/data_sources/remote/providers.dart';
import 'package:dayout_weather/data/repositories/weather_repository_impl.dart';
import 'package:dayout_weather/domain/repositories/weather_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<IWeatherRepository> weatherRepositoryProvider = Provider<IWeatherRepository>((ref) {
  return WeatherRepositoryImpl(dataSource: ref.watch(weatherRemoteDataSourceProvider));
});
