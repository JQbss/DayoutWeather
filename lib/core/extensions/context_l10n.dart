import 'package:dayout_weather/l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';

extension ContextL10n on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this) ?? (throw StateError('No AppLocalizations found in context'));
}
