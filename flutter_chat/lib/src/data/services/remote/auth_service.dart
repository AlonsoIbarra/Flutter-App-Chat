import 'package:flutter_chat/src/domain/models/user/user.dart';

import '../../http_client/http.dart';
import '../../http_client/http_response.dart';

class AuthService {
  final Http _http;

  AuthService(this._http);

  Future<HttpResponse<User?>> login(String email, String password) async {
    return await _http.request(
      '/api/user/login',
      data: {
        'email': email,
        'password': password,
      },
      method: 'POST',
      useAuthHeaders: false,
      parser: (statusCode, json) {
        if (json['success']) {
          return User.fromJson(json['data']);
        }
        return null;
      },
    );
  }
}
