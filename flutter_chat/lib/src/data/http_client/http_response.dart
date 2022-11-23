import 'package:dio/dio.dart';

class HttpResponse<T> {
  final HttpError? error;
  final T? data;
  final int statusCode;

  HttpResponse({
    this.error,
    this.data,
    required this.statusCode,
  });
  static HttpResponse<T> sucess<T>(int statusCode, T data) => HttpResponse<T>(
        error: null,
        data: data,
        statusCode: statusCode,
      );

  static HttpResponse<T> fail<T>({
    required int statusCode,
    required String message,
    required dynamic data,
    required bool failedRefresh,
    required DioErrorType type,
  }) =>
      HttpResponse<T>(
        error: HttpError(
          message: message,
          data: data,
          failedRefresh: failedRefresh,
          type: type,
        ),
        data: null,
        statusCode: statusCode,
      );
}

class HttpError {
  final String message;
  final dynamic data;
  final bool failedRefresh;
  final DioErrorType type;

  HttpError({
    required this.message,
    required this.type,
    required this.data,
    required this.failedRefresh,
  });
}
