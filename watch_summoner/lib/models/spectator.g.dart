// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spectator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Spectator _$SpectatorFromJson(Map<String, dynamic> json) {
  return Spectator(
    json['gameId'] as int,
    json['gameMode'] as String,
    json['mapId'] as int,
    (json['participants'] as List)
        ?.map((e) =>
            e == null ? null : Participants.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['bannedChampions'] as List)
        ?.map((e) => e == null
            ? null
            : BannedChampion.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SpectatorToJson(Spectator instance) => <String, dynamic>{
      'gameId': instance.gameId,
      'gameMode': instance.gameMode,
      'mapId': instance.mapId,
      'participants': instance.participants,
      'bannedChampions': instance.bannedChampions,
    };
