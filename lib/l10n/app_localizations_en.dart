// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get errorNetwork => 'No internet connection.';

  @override
  String get errorServer => 'Server error.';

  @override
  String get errorUnknown => 'An unexpected error occurred.';
}
