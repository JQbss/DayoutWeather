sealed class AppException implements Exception {
  const AppException(this.message);
  final String message;
}

class NetworkException extends AppException {
  const NetworkException() : super('No internet connection.');
}

class ServerException extends AppException {
  const ServerException(super.message);
}

class UnknownException extends AppException {
  const UnknownException() : super('An unexpected error occurred.');
}
