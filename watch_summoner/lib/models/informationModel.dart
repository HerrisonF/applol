import 'package:watch_summoner/models/ranked.dart';

import 'Champion.dart';
import 'lastPlayedGame.dart';
import 'summoner.dart';

class InformationModel {
  Summoner summoner;
  List<Champion> champions;
  List<Ranked> rankedSts;
  List<LastPlayedGame> lastPlayedGame;

  InformationModel({
    this.summoner,
    this.champions,
    this.rankedSts,
    this.lastPlayedGame,
  });

  @override
  String toString() {
    return 'InformationModel{summoner: $summoner, champions: $champions, ranked: $rankedSts, lastPlayedGame: $lastPlayedGame';
  }
}
