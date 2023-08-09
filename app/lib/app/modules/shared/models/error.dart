class ErrorRegisterExceptionModel implements Exception {
  final Map<String, dynamic> errors;

  ErrorRegisterExceptionModel(this.errors);

  @override
  String toString() {
    return '$errors';
  }
}
