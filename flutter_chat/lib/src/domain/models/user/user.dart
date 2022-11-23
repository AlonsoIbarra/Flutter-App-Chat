// ignore_for_file: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

import '../utils/datetime_converter.dart';
import '../utils/integer_converter.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();
  factory User({
    @StringToIntConverter()
        int? id,
    required String user,
    required String email,
    required String name,
    required String phone,
    String? image,
    String? password,
    @JsonKey(
      name: 'is_availabe',
      defaultValue: true,
    )
        bool? isAvailabe,
    @JsonKey(
      name: 'session_token',
      defaultValue: '',
    )
        String? sessionToken,
    @JsonKey(
      name: 'created_at',
    )
    @DateTimeConverterNull()
        DateTime? createdAt,
    @JsonKey(
      name: 'updated_at',
    )
    @DateTimeConverterNull()
        DateTime? updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
