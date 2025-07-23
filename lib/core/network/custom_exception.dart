class ValidationException implements Exception {
  final String message;
  const ValidationException(this.message);
}

class ConflictException implements Exception {
  final String message;
  const ConflictException(this.message);
}

class ServerException implements Exception {
  final String message;
  const ServerException(this.message);
}

class NetworkException implements Exception {
  final String message;
  const NetworkException(this.message);
}
