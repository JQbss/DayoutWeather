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

    return Scaffold(
      body: AsyncBuilder(
        value: state,
        data: (weather) => _buildContent(context, weather: weather),
      ),
    );
  }

  Widget _buildContent(BuildContext context, {required WeatherReading weather}) {
    return Center(
      child: Text(
        '${weather.temperature?.toStringAsFixed(1) ?? '--'}°C',
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }
}
