// ignore_for_file: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

import '../datetime_converter.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();
  factory User({
    required int id,
    required String email,
    required String name,
    required String phone,
    required String image,
    @JsonKey(
      name: 'is_availabe',
    )
        required bool isAvailabe,
    @JsonKey(
      name: 'session_token',
    )
        required String sessionToken,
    @JsonKey(
      name: 'created_at',
    )
    @DateTimeConverterNotNull()
        required DateTime createdAt,
    @JsonKey(
      name: 'updated_at',
    )
    @DateTimeConverterNotNull()
        required DateTime updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
