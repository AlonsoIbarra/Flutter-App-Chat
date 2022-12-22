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

  @override
  Future<Either<HttpRequestError, User>> updateProfileImage(
      User user, String imagePath) async {
    final result = await _userService.updateProfileImage(
      user,
      imagePath,
    );
    if (result.error == null) {
      return Right(result.data!);
    }
    return handleHttpRequestError(result);
  }

  @override
  Future<Either<HttpRequestError, User>> updateUser(User userUpdated) async {
    final result = await _userService.updateUser(userUpdated);

    if (result.error == null) {
      return Right(result.data!);
    }
    return handleHttpRequestError(result);
  }

  @override
  Future<Either<HttpRequestError, List<User>>> listAllUsers() async {
    final result = await _userService.listAllUsers();
    if (result.error == null) {
      return Right(result.data ?? []);
    }
    return handleHttpRequestError(result);
  }
}
