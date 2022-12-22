import 'package:flutter_chat/src/domain/models/user/user.dart';

import '../either/either.dart';
import '../errors/http_errors/http_request_error.dart';

abstract class AbstractMessagesRepository {
  Future<Either<HttpRequestError, List<String>>> listMessages(User reciber);
}
