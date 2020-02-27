// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stats _$StatsFromJson(Map<String, dynamic> json) {
  return Stats(
    (json['hp'] as num)?.toDouble(),
    (json['hpperlevel'] as num)?.toDouble(),
    (json['mp'] as num)?.toDouble(),
    (json['mpperlevel'] as num)?.toDouble(),
    (json['movespeed'] as num)?.toDouble(),
    (json['armor'] as num)?.toDouble(),
    (json['armorperlevel'] as num)?.toDouble(),
    (json['spellblock'] as num)?.toDouble(),
    (json['spellblockperlevel'] as num)?.toDouble(),
    (json['attackrange'] as num)?.toDouble(),
    (json['hpregen'] as num)?.toDouble(),
    (json['hpregenperlevel'] as num)?.toDouble(),
    (json['mpregen'] as num)?.toDouble(),
    (json['mpregenperlevel'] as num)?.toDouble(),
    (json['crit'] as num)?.toDouble(),
    (json['critperlevel'] as num)?.toDouble(),
    (json['attackdamage'] as num)?.toDouble(),
    (json['attackdamageperlevel'] as num)?.toDouble(),
    (json['attackspeedperlevel'] as num)?.toDouble(),
    (json['attackspeed'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$StatsToJson(Stats instance) => <String, dynamic>{
      'hp': instance.hp,
      'hpperlevel': instance.hpperlevel,
      'mp': instance.mp,
      'mpperlevel': instance.mpperlevel,
      'movespeed': instance.movespeed,
      'armor': instance.armor,
      'armorperlevel': instance.armorperlevel,
      'spellblock': instance.spellblock,
      'spellblockperlevel': instance.spellblockperlevel,
      'attackrange': instance.attackrange,
      'hpregen': instance.hpregen,
      'hpregenperlevel': instance.hpregenperlevel,
      'mpregen': instance.mpregen,
      'mpregenperlevel': instance.mpregenperlevel,
      'crit': instance.crit,
      'critperlevel': instance.critperlevel,
      'attackdamage': instance.attackdamage,
      'attackdamageperlevel': instance.attackdamageperlevel,
      'attackspeedperlevel': instance.attackspeedperlevel,
      'attackspeed': instance.attackspeed,
    };
