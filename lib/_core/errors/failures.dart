class Failure {
  final String message;
  final String? code; // Optional error code

  Failure(this.message, {this.code});

  @override
  String toString() => 'Failure(message: $message, code: $code)';
}
