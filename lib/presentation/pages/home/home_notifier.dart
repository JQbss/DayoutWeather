import 'package:dayout_weather/domain/entities/weather_reading.dart';
import 'package:dayout_weather/domain/usecases/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_notifier.g.dart';

@riverpod
class HomeNotifier extends _$HomeNotifier {
  @override
  Future<WeatherReading> build() => _fetch();

  Future<WeatherReading> _fetch() => ref.read(getCurrentWeatherUseCaseProvider)(lat: 52.2297, lon: 21.0122);

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetch);
  }
}
