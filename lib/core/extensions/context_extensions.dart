import 'package:dayout_weather/core/theme/weather_theme.dart';
import 'package:dayout_weather/core/theme/weather_theme_data.dart';
import 'package:dayout_weather/l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';

extension ContextL10n on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this) ?? (throw StateError('No AppLocalizations found in context'));
}

extension ContextTheme on BuildContext {
  WeatherThemeData get wt => WeatherTheme.of(this);
}
