import '../../../domain/models/user/user.dart';
import '../../http_client/http.dart';
import '../../http_client/http_response.dart';

class MessageService {
  final Http _http;

  MessageService(this._http);

  Future<HttpResponse<List<String>>> getUserMessages(
    User reciber,
  ) async {
    return await _http.request(
      '/api/messages/',
      method: 'GET',
      useAuthHeaders: true,
      parser: (statusCode, response) {
        if (statusCode == 200) {
          return response['data'];
        }
        return [];
      },
      data: {
        'reciber': reciber.id,
      },
    );
  }
}
