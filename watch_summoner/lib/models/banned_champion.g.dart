// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banned_champion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannedChampion _$BannedChampionFromJson(Map<String, dynamic> json) {
  return BannedChampion(
    json['teamId'] as int,
    json['championId'] as int,
  );
}

Map<String, dynamic> _$BannedChampionToJson(BannedChampion instance) =>
    <String, dynamic>{
      'teamId': instance.teamId,
      'championId': instance.championId,
    };
