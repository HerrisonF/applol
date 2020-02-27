import 'package:json_annotation/json_annotation.dart';
import 'package:watch_summoner/models/champInfo.dart';
import 'package:watch_summoner/models/passive.dart';
import 'package:watch_summoner/models/stats.dart';

part 'championDetail.g.dart';

@JsonSerializable()
class ChampionDetail {
  String id;
  String key;
  String name;
  String title;
  String lore;
  List<String> allyTips;
  List<String> enemyTips;
  List<String> tags;
  ChampInfo champInfo;
  Stats stats;
  Passive passive;


  ChampionDetail(this.id, this.key, this.name, this.title, this.lore,
      this.allyTips, this.enemyTips, this.tags, this.champInfo, this.stats,
      this.passive);

  factory ChampionDetail.fromJson(Map<String, dynamic> json) => _$ChampionDetailFromJson(json);

  Map<String, dynamic> toJson(ChampionDetail instance) => <String, dynamic>{
    'id': instance.id,
    'key': instance.key,
    'name': instance.name,
    'title': instance.title,
    'lore': instance.lore,
    'tags': instance.tags,
    'allyTips': instance.allyTips,
    'enemyTips': instance.enemyTips,
    'info': instance.champInfo,
    'stats': instance.stats,
    'passive': instance.passive,
  };
}