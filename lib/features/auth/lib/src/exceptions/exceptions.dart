library;

class MissingBodyException implements Exception {
  @override
  String toString() => "Response body is missing";
}

class ServerException implements Exception {
  @override
  String toString() => "Server error";
}
