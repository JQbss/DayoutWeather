import 'package:dayout_weather/core/network/dio_provider.dart';
import 'package:dayout_weather/data/data_sources/remote/weather_remote_data_source.dart';
import 'package:dayout_weather/data/mappers/weather_mapper.dart';
import 'package:dayout_weather/data/repositories/weather_repository_impl.dart';
import 'package:dayout_weather/domain/repositories/weather_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. Mapper — nie ma zależności, czysty obiekt pomocniczy
final weatherMapperProvider = Provider<WeatherMapper>((ref) {
  return WeatherMapper();
});

// 2. DataSource — potrzebuje Dio (pobieramy przez ref.watch)
final weatherRemoteDataSourceProvider = Provider<WeatherRemoteDataSource>((ref) {
  final dio = ref.watch(openMeteoDioProvider);
  return WeatherRemoteDataSource(dio);
});

// 3. Repository — eksponujemy jako interfejs (IWeatherRepository), nie impl
//    To ważne: widgety/notifery nie wiedzą o istnieniu WeatherRepositoryImpl
final weatherRepositoryProvider = Provider<IWeatherRepository>((ref) {
  return WeatherRepositoryImpl(
    dataSource: ref.watch(weatherRemoteDataSourceProvider),
    mapper: ref.watch(weatherMapperProvider),
  );
});
