import 'package:dayout_weather/core/errors/app_exception.dart';
import 'package:dayout_weather/l10n/app_localizations.dart';

extension AppExceptionL10n on AppException {
  String toLocalizedMessage(AppLocalizations l10n) => switch (this) {
        NetworkException() => l10n.errorNetwork,
        ServerException() => l10n.errorServer,
        UnknownException() => l10n.errorUnknown,
      };
}
