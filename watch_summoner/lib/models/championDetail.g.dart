// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'championDetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChampionDetail _$ChampionDetailFromJson(Map<String, dynamic> json) {
  return ChampionDetail(
    json['id'] as String,
    json['key'] as String,
    json['name'] as String,
    json['title'] as String,
    json['lore'] as String,
    (json['allyTips'] as List)?.map((e) => e as String)?.toList(),
    (json['enemyTips'] as List)?.map((e) => e as String)?.toList(),
    (json['tags'] as List)?.map((e) => e as String)?.toList(),
    json['champInfo'] == null
        ? null
        : ChampInfo.fromJson(json['champInfo'] as Map<String, dynamic>),
    json['stats'] == null
        ? null
        : Stats.fromJson(json['stats'] as Map<String, dynamic>),
    json['passive'] == null
        ? null
        : Passive.fromJson(json['passive'] as Map<String, dynamic>),
    json['alias'] as String,
  )..spells = (json['spells'] as List)
      ?.map((e) => e == null ? null : Spell.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$ChampionDetailToJson(ChampionDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'name': instance.name,
      'alias': instance.alias,
      'title': instance.title,
      'lore': instance.lore,
      'allyTips': instance.allyTips,
      'enemyTips': instance.enemyTips,
      'tags': instance.tags,
      'spells': instance.spells,
      'champInfo': instance.champInfo,
      'stats': instance.stats,
      'passive': instance.passive,
    };
