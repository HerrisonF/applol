import 'package:json_annotation/json_annotation.dart';

part 'champInfo.g.dart';

@JsonSerializable()
class ChampInfo{
  int attack;
  int defense;
  int magic;
  int difficulty;
  ChampInfo(this.attack, this.defense, this.magic, this.difficulty);
  factory ChampInfo.fromJson(Map<String, dynamic> json) => _$ChampInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ChampInfoToJson(this);
}