// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symbol.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Symbol _$SymbolFromJson(Map<String, dynamic> json) => Symbol()
  ..indices = (json['indices'] as List<dynamic>?)?.map((e) => e as int).toList()
  ..text = json['text'] as String?;

Map<String, dynamic> _$SymbolToJson(Symbol instance) => <String, dynamic>{
      'indices': instance.indices,
      'text': instance.text,
    };
