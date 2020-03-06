import 'package:json_annotation/json_annotation.dart';

part 'participants.g.dart';

@JsonSerializable()
class Participants{
  int profileIconId;
  int championId;
  String summonerName;
  String summonerId;
  int spell1Id;
  int spell2Id;
  int teamId;

  Participants(this.profileIconId, this.championId, this.summonerName,
      this.summonerId, this.spell1Id, this.spell2Id, this.teamId);

  factory Participants.fromJson(Map<String, dynamic> json) => _$ParticipantsFromJson(json);

  Map<String, dynamic> toJson () => _$ParticipantsToJson(this);
}