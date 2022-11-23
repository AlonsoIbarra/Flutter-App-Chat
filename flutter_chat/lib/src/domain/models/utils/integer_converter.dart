import 'package:json_annotation/json_annotation.dart';

class StringToIntConverter implements JsonConverter<int, String> {
  const StringToIntConverter();

  @override
  int fromJson(String value) {
    if (value is num) {
      return int.parse(value);
    }
    return int.tryParse(value) ?? 0;
  }

  @override
  String toJson(int value) => value.toString();
}
