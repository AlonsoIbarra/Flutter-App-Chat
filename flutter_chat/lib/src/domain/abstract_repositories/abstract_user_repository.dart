import 'package:flutter_chat/src/domain/models/user/user.dart';

import '../either/either.dart';
import '../errors/http_errors/http_request_error.dart';

abstract class AbstractUserRepository {
  Future<Either<HttpRequestError, bool>> createUser(User user);
  Future<Either<HttpRequestError, User>> updateProfileImage(
    User user,
    String imagePath,
  );

  Future<Either<HttpRequestError, User>> updateUser(User newUser);
}
