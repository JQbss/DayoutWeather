sealed class AppException implements Exception {
  const AppException();
}

class NetworkException extends AppException {
  const NetworkException();
}

class ServerException extends AppException {
  final String message;
  const ServerException(this.message);
}

class UnknownException extends AppException {
  const UnknownException();
}
