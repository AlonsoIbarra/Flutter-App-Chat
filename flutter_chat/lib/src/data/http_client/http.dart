import 'package:dio/dio.dart';

import 'http_response.dart';

class Http {
  final Dio dio;

  Http(
    this.dio,
  );

  Future<HttpResponse<T>> request<T>(
    String path, {
    String method = 'GET',
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Map<String, String?>? headers,
    T Function(int statusCode, dynamic data)? parser,
    bool useAuthHeaders = false,
    CancelToken? cancelToken,
    FormData? formData,
  }) async {
    try {
      headers?.removeWhere((key, value) => value == null);

      final Response response = await dio.request(
        path,
        data: (formData != null) ? formData : data,
        queryParameters: queryParameters,
        options: Options(
          method: method,
          headers: headers,
        ),
        cancelToken: cancelToken,
      );

      return parser == null
          ? HttpResponse.sucess<T>(
              response.statusCode!,
              response.data,
            )
          : HttpResponse.sucess<T>(
              response.statusCode!,
              parser(response.statusCode!, response.data),
            );
    } on DioError catch (e, s) {
      String message = e.message;
      dynamic responseData;
      int statusCode = 0;
      if (e.response != null) {
        statusCode = e.response!.statusCode!;
        responseData = e.response!.data;
        message = e.response!.statusMessage!;
      }

      return HttpResponse.fail<T>(
        statusCode: statusCode,
        message: message,
        data: responseData,
        failedRefresh: statusCode == 401,
        type: e.type,
      );
    } catch (e, s) {
      int statusCode = -1;

      return HttpResponse.fail<T>(
        statusCode: statusCode,
        message: e.toString(),
        data: null,
        failedRefresh: false,
        type: DioErrorType.other,
      );
    }
  }
}
