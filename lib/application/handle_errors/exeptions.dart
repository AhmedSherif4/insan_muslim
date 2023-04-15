
class ServerException implements Exception {
  final int errorCode;
  final String errorMessage;

  ServerException({required this.errorCode, required this.errorMessage});
}
