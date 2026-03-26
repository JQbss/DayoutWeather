// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get errorNetwork => 'Brak połączenia z internetem.';

  @override
  String get errorServer => 'Błąd serwera.';

  @override
  String get errorUnknown => 'Wystąpił nieoczekiwany błąd.';
}
