import 'package:dio/dio.dart';
import 'package:flutter_chat/src/domain/models/user/user.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime_type/mime_type.dart';
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;
import '../../http_client/http.dart';
import '../../http_client/http_response.dart';

class UserService {
  final Http _http;

  UserService(this._http);

  Future<HttpResponse<bool>> create(User user) async {
    Map<String, dynamic> data = user.toJson();
    if (user.image != null && user.image!.isNotEmpty) {
      final xFile = XFile(user.image!);
      final mimeType = mime(xFile.path);
      String mimee = mimeType!.split('/')[0];
      String type = mimeType.split('/')[1];

      final payload = FormData.fromMap(
        {
          ...data,
          'image': MultipartFile.fromBytes(
            await xFile.readAsBytes(),
            contentType: MediaType(mimee, type),
            filename: 'image${p.extension(xFile.name)}',
          ),
        },
      );
      return await _http.request(
        '/api/user/',
        method: 'POST',
        useAuthHeaders: false,
        parser: (statusCode, json) {
          return json['success'];
        },
        formData: payload,
      );
    }
    return _http.request(
      '/api/user-without-image/',
      method: 'POST',
      useAuthHeaders: false,
      parser: (statusCode, json) {
        return json['success'];
      },
      data: data,
    );
  }
}
