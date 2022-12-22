import 'package:flutter_chat/src/data/services/remote/message_service.dart';
import 'package:flutter_chat/src/domain/models/user/user.dart';

import 'package:flutter_chat/src/domain/errors/http_errors/http_request_error.dart';

import 'package:flutter_chat/src/domain/either/either.dart';

import '../../domain/abstract_repositories/abstract_messages_repository.dart';
import '../mixins/handle_http_request_error.dart';

class MessagesRepository
    with HandleHttpRequestErrorMixin
    implements AbstractMessagesRepository {
  final MessageService _messageService;

  MessagesRepository(this._messageService);
  @override
  Future<Either<HttpRequestError, List<String>>> listMessages(
    User reciber,
  ) async {
    final result = await _messageService.getUserMessages(reciber);
    if (result.error == null) {
      return Right(result.data ?? []);
    }
    return handleHttpRequestError(result);
  }
}
