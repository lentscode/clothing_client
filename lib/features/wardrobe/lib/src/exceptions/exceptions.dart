library;

class UnexpectedContentTypeException implements Exception {
  @override
  String toString() => "The content type of the response was unexpected.";
}
