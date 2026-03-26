import 'package:dayout_weather/data/repositories/providers.dart';
import 'package:dayout_weather/domain/usecases/get_current_weather_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<GetCurrentWeatherUseCase> getCurrentWeatherUseCaseProvider = Provider<GetCurrentWeatherUseCase>((ref) {
  return GetCurrentWeatherUseCase(repository: ref.watch(weatherRepositoryProvider));
});
