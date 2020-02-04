import 'package:watch_summoner/http/config/webclient.dart';
import 'package:watch_summoner/models/Champion.dart';

final String championMasteryPath =
    'lol/champion-mastery/v4/champion-masteries/by-summoner/';

Future<List<Champion>> getChampionMasteryBySummonerName(
    encryptedSummonerName) async {

  List<dynamic> decodedJson =
      await getListWebClient(championMasteryPath, encryptedSummonerName);

  return decodedJson.map(
    (dynamic json) {
      return Champion.fromJson(json);
    },
  ).toList();
}

Future<List<Champion>> getHighMasteryChamp(encryptedSummonerName) async {
  List<Champion> listMastery = new List();
  List<Champion> list = await getChampionMasteryBySummonerName(encryptedSummonerName);

  for (int i = 0; i < 3; i++) {
    listMastery.add(list[i]);
  }

  return listMastery;
}
