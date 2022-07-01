import 'dart:io';

import 'package:higher_lower/app/data/exception/base_api_exception.dart';

class UnauthorizedException extends BaseApiException {
  UnauthorizedException(String message)
      : super(
          httpCode: HttpStatus.unauthorized,
          message: message,
          status: "unauthorized",
        );
}
