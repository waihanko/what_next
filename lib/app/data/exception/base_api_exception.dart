import 'package:higher_lower/app/data/exception/app_exception.dart';

abstract class BaseApiException extends AppException {
  final int httpCode;
  final String status;

  BaseApiException({
    this.httpCode = -1,
    this.status = "",
    String message = "",
  }) : super(message: message);
}
