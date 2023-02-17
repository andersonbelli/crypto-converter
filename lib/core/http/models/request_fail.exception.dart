import 'package:crypto_converter/core/http/models/base.exception.dart';

class RequestFailException extends BaseException {
  const RequestFailException({
    String message = 'Fail to request data :(',
    int? statusCode,
  }) : super(message, statusCode: statusCode);
}
