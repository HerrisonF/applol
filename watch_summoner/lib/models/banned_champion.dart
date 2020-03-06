import 'package:json_annotation/json_annotation.dart';

part 'banned_champion.g.dart';

@JsonSerializable()
class BannedChampion{
  int teamId;
  int championId;

  BannedChampion(this.teamId, this.championId);

  factory BannedChampion.fromJson(Map<String, dynamic> json) => _$BannedChampionFromJson(json);

  Map<String, dynamic> toJson() => _$BannedChampionToJson(this);

}