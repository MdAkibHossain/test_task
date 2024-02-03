


import '../exceptions/network_exceptions.dart';

class ErrorMessage {
  final NetworkExceptions type;
  final String message;
  final String code;

  ErrorMessage({
    required this.type,
    required this.message,
    required this.code,
  });
}
