import 'package:json_annotation/json_annotation.dart';
import 'package:watch_summoner/models/participants.dart';

import 'banned_champion.dart';

part 'spectator.g.dart';

@JsonSerializable()
class Spectator{

  int gameId;
  String gameMode;
  int mapId;
  List<Participants> participants;
  List<BannedChampion> bannedChampions;

  Spectator(this.gameId, this.gameMode, this.mapId, this.participants,
      this.bannedChampions);

  factory Spectator.fromJson(Map<String, dynamic> json) => _$SpectatorFromJson(json);

  Map<String, dynamic> toJson(Spectator instance) => <String, dynamic>{
    'gameId' : instance.gameId,
    'gameMode' : instance.gameMode,
    'mapId' : instance.mapId,
    'participants' : instance.participants.map((v) => v.toJson()).toList(),
    'bannedChampions' : instance.bannedChampions.map((v) => v.toJson()).toList(),
  };
}