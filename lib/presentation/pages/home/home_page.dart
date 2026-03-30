import 'package:dayout_weather/core/theme/weather_theme.dart';
import 'package:dayout_weather/core/theme/weather_theme_data.dart';
import 'package:dayout_weather/domain/entities/weather_reading.dart';
import 'package:dayout_weather/presentation/widgets/async_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_notifier.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<WeatherReading> state = ref.watch(homeProvider);

    return AsyncBuilder(
      value: state,
      data: (WeatherReading weather) => WeatherTheme(
        data: WeatherThemeData.fromCondition(weather.condition),
        child: _buildBody(context, weather: weather),
      ),
    );
  }

  Widget _buildBody(BuildContext context, {required WeatherReading weather}) {
    final WeatherThemeData wt = WeatherTheme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: wt.backgroundGradient,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Text(
            '${weather.temperature?.toStringAsFixed(1) ?? '--'}°C',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
      ),
    );
  }
}
