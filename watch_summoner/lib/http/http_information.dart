
import 'package:watch_summoner/http/http_champion.dart';
import 'package:watch_summoner/http/http_match.dart';
import 'package:watch_summoner/http/http_ranked.dart';
import 'package:watch_summoner/http/http_summoner.dart';
import 'package:watch_summoner/models/Champion.dart';
import 'package:watch_summoner/models/informationModel.dart';
import 'package:watch_summoner/models/lastPlayedGame.dart';
import 'package:watch_summoner/models/ranked.dart';
import 'package:watch_summoner/models/summoner.dart';

Future<InformationModel> getAllInformation(String summonerName) async {
  Summoner summoner = new Summoner();
  List<Champion> listMastery = new List();
  List<Ranked> ranked = new List();
  List<LastPlayedGame> lastPlayedGame = new List();

  summoner = await getSummonerCredentials(summonerName);
  listMastery = await getHighMasteryChamp(summoner.id);
  ranked = await getRankedStats(summoner.id);
  lastPlayedGame = await getLastPlayedGames(summoner.accountId);

  return InformationModel(summoner: summoner, champions: listMastery, rankedSts: ranked, lastPlayedGame: lastPlayedGame);
}