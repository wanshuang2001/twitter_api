// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedUsers _$PaginatedUsersFromJson(Map<String, dynamic> json) =>
    PaginatedUsers()
      ..users = (json['users'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList()
      ..nextCursorStr = json['next_cursor_str'] as String?
      ..previousCursorStr = json['previous_cursor_str'] as String?;

Map<String, dynamic> _$PaginatedUsersToJson(PaginatedUsers instance) =>
    <String, dynamic>{
      'users': instance.users?.map((e) => e.toJson()).toList(),
      'next_cursor_str': instance.nextCursorStr,
      'previous_cursor_str': instance.previousCursorStr,
    };
