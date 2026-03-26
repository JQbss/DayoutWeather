import 'package:dayout_weather/presentation/widgets/app_progress_indicator.dart';
import 'package:dayout_weather/presentation/widgets/error_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncBuilder<T> extends StatelessWidget {
  const AsyncBuilder({super.key, required this.value, required this.data});

  final AsyncValue<T> value;
  final Widget Function(T data) data;

  @override
  Widget build(BuildContext context) {
    return value.when(
      loading: () => const AppProgressIndicator(),
      error: (error, _) => ErrorView(error: error),
      data: data,
    );
  }
}
