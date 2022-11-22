import 'package:json_annotation/json_annotation.dart';

class DateTimeConverterNotNull implements JsonConverter<DateTime, String> {
  const DateTimeConverterNotNull();

  @override
  DateTime fromJson(String text) {
    final timeZoneOffset = DateTime.now().timeZoneOffset;
    return DateTime.parse(text).add(
      timeZoneOffset,
    );
  }

  @override
  String toJson(DateTime object) {
    return object.toUtc().toIso8601String();
  }
}
