class ServerException implements Exception {
  final String message;

  ServerException([this.message = "Terjadi kesalahan pada server"]);

  @override
  String toString() => message;
}

class CacheException implements Exception {}
