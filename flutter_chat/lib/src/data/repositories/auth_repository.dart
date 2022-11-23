import 'package:flutter_chat/src/data/services/remote/auth_service.dart';
import 'package:flutter_chat/src/domain/abstract_repositories/abstract_auth_repository.dart';
import 'package:flutter_chat/src/domain/models/user/user.dart';
import 'package:flutter_chat/src/domain/errors/http_errors/http_request_error.dart';
import 'package:flutter_chat/src/domain/either/either.dart';

import '../mixins/handle_http_request_error.dart';

class AuthRepository
    with HandleHttpRequestErrorMixin
    implements AbstractAuthRepository {
  final AuthService _authService;

  AuthRepository(this._authService);
  @override
  Future<Either<HttpRequestError, User?>> login(
      String email, String password) async {
    final result = await _authService.login(
      email,
      password,
    );
    if (result.error == null) {
      return Right(result.data);
    }
    return handleHttpRequestError(result);
  }
}
