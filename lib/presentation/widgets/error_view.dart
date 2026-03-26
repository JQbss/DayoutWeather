import 'package:dayout_weather/core/errors/app_exception.dart';
import 'package:dayout_weather/core/extensions/context_l10n.dart';
import 'package:dayout_weather/presentation/extensions/app_exception_l10n.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final Object error;
  const ErrorView({super.key, required this.error});


  @override
  Widget build(BuildContext context) {
    final String message = error is AppException
        ? (error as AppException).toLocalizedMessage(context.l10n)
        : error.toString();

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.cloud_off, size: 64),
          const SizedBox(height: 16),
          Text(
            message,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
