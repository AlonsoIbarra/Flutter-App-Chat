import 'package:freezed_annotation/freezed_annotation.dart';

part 'http_request_error.freezed.dart';

@freezed
class HttpRequestError with _$HttpRequestError {
  const factory HttpRequestError.network() = NetworkError;
  const factory HttpRequestError.notFound() = NotFoundError;
  const factory HttpRequestError.serverError() = ServerError;
  const factory HttpRequestError.unhandled() = UnhandledError;
  factory HttpRequestError.customError({required String message}) =
      _CustomError;
}
