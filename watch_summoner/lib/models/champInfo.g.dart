// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'champInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChampInfo _$ChampInfoFromJson(Map<String, dynamic> json) {
  return ChampInfo(
    json['attack'] as int,
    json['defense'] as int,
    json['magic'] as int,
    json['difficulty'] as int,
  );
}

Map<String, dynamic> _$ChampInfoToJson(ChampInfo instance) => <String, dynamic>{
      'attack': instance.attack,
      'defense': instance.defense,
      'magic': instance.magic,
      'difficulty': instance.difficulty,
    };
