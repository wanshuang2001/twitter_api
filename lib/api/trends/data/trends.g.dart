// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trends.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trends _$TrendsFromJson(Map<String, dynamic> json) => Trends()
  ..trends = (json['trends'] as List<dynamic>?)
      ?.map((e) => Trend.fromJson(e as Map<String, dynamic>))
      .toList()
  ..asOf = convertTwitterDateTime(json['as_of'] as String?)
  ..createdAt = convertTwitterDateTime(json['created_at'] as String?)
  ..locations = (json['locations'] as List<dynamic>?)
      ?.map((e) => TrendLocation.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$TrendsToJson(Trends instance) => <String, dynamic>{
      'trends': instance.trends?.map((e) => e.toJson()).toList(),
      'as_of': instance.asOf?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'locations': instance.locations?.map((e) => e.toJson()).toList(),
    };
