import 'package:dayout_weather/domain/entities/weather_reading.dart';
import 'package:dayout_weather/presentation/widgets/async_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_notifier.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<WeatherReading> state = ref.watch(homeProvider);

    return Scaffold(
      body: AsyncValueWidget(
        value: state,
        data: (weather) => Center(
          child: Text(
            '${weather.temperature?.toStringAsFixed(1) ?? '--'}°C',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(homeProvider.notifier).refresh(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
