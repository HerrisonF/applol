import 'package:json_annotation/json_annotation.dart';
part 'stats.g.dart';

@JsonSerializable()
class Stats{
  double hp;
  double hpperlevel;
  double mp;
  double mpperlevel;
  double movespeed;
  double armor;
  double armorperlevel;
  double spellblock;
  double spellblockperlevel;
  double attackrange;
  double hpregen;
  double hpregenperlevel;
  double mpregen;
  double mpregenperlevel;
  double crit;
  double critperlevel;
  double attackdamage;
  double attackdamageperlevel;
  double attackspeedperlevel;
  double attackspeed;


  Stats(this.hp, this.hpperlevel, this.mp, this.mpperlevel, this.movespeed,
      this.armor, this.armorperlevel, this.spellblock, this.spellblockperlevel,
      this.attackrange, this.hpregen, this.hpregenperlevel, this.mpregen,
      this.mpregenperlevel, this.crit, this.critperlevel, this.attackdamage,
      this.attackdamageperlevel, this.attackspeedperlevel, this.attackspeed);

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
  Map<String, dynamic> toJson() => _$StatsToJson(this);
}