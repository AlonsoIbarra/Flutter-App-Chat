import '../../domain/either/either.dart';
import '../../domain/errors/http_errors/http_request_error.dart';
import '../http_client/http_response.dart';

mixin HandleHttpRequestErrorMixin {
  Left<HttpRequestError, R> handleHttpRequestError<R>(HttpResponse<R> result) {
    if (result.statusCode == 0) {
      return Left(
        const HttpRequestError.network(),
      );
    }
    if (result.statusCode == 404) {
      return Left(
        const HttpRequestError.notFound(),
      );
    }

    if (result.statusCode >= 500) {
      return Left(
        const HttpRequestError.serverError(),
      );
    }

    return Left(
      const HttpRequestError.unhandled(),
    );
  }
}
