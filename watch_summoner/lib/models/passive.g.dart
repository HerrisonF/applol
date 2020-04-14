// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Passive _$PassiveFromJson(Map<String, dynamic> json) {
  return Passive(
    json['name'] as String,
    json['description'] as String,
    json['image'] == null
        ? null
        : Image.fromJson(json['image'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PassiveToJson(Passive instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
    };
