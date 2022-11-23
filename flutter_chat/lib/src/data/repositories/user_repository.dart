import 'package:flutter_chat/src/domain/models/user/user.dart';

import 'package:flutter_chat/src/domain/errors/http_errors/http_request_error.dart';

import 'package:flutter_chat/src/domain/either/either.dart';

import '../../domain/abstract_repositories/abstract_user_repository.dart';
import '../mixins/handle_http_request_error.dart';
import '../services/remote/user_service.dart';

class UserRepository
    with HandleHttpRequestErrorMixin
    implements AbstractUserRepository {
  final UserService _userService;

  UserRepository(this._userService);
  @override
  Future<Either<HttpRequestError, bool>> createUser(User user) async {
    final result = await _userService.create(user);
    if (result.error == null) {
      return Right(result.data!);
    }
    return handleHttpRequestError(result);
  }
}
