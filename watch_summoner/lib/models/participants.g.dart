// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participants.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Participants _$ParticipantsFromJson(Map<String, dynamic> json) {
  return Participants(
    json['profileIconId'] as int,
    json['championId'] as int,
    json['summonerName'] as String,
    json['summonerId'] as String,
    json['spell1Id'] as int,
    json['spell2Id'] as int,
    json['teamId'] as int,
  );
}

Map<String, dynamic> _$ParticipantsToJson(Participants instance) =>
    <String, dynamic>{
      'profileIconId': instance.profileIconId,
      'championId': instance.championId,
      'summonerName': instance.summonerName,
      'summonerId': instance.summonerId,
      'spell1Id': instance.spell1Id,
      'spell2Id': instance.spell2Id,
      'teamId': instance.teamId,
    };
