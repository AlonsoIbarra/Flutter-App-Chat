import 'package:flutter_chat/src/domain/models/user/user.dart';

import '../../http_client/http.dart';
import '../../http_client/http_response.dart';

class UserService {
  final Http _http;

  UserService(this._http);

  Future<HttpResponse<bool>> create(User user) async {
    return _http.request(
      '/api/user/',
      data: user.toJson(),
      method: 'POST',
      useAuthHeaders: false,
      parser: (statusCode, json) {
        return true;
      },
    );
  }
}
