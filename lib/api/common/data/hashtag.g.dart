// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hashtag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hashtag _$HashtagFromJson(Map<String, dynamic> json) => Hashtag()
  ..indices = (json['indices'] as List<dynamic>?)?.map((e) => e as int).toList()
  ..text = json['text'] as String?;

Map<String, dynamic> _$HashtagToJson(Hashtag instance) => <String, dynamic>{
      'indices': instance.indices,
      'text': instance.text,
    };
