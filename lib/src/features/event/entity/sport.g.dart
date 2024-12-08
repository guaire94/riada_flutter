// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sport.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sport _$SportFromJson(Map<String, dynamic> json) => Sport(
      id: json['id'] as String,
      name: json['name'] as String,
      emoticon: json['emoticon'] as String,
      covers:
          (json['covers'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$SportToJson(Sport instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'emoticon': instance.emoticon,
      'covers': instance.covers,
    };
