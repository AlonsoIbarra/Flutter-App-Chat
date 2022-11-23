import 'package:flutter_chat/src/domain/models/user/user.dart';

import '../either/either.dart';
import '../errors/http_errors/http_request_error.dart';

abstract class AbstractAuthRepository {
  Future<Either<HttpRequestError, User?>> login(String email, String password);
}
