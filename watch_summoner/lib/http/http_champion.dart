import 'dart:convert';

import 'package:http/http.dart';
import 'package:watch_summoner/http/config/webclient.dart';
import 'package:watch_summoner/models/Champion.dart';
import 'package:watch_summoner/models/ChampionSummary.dart';
import 'package:watch_summoner/models/championDetail.dart';

final String championMasteryPath =
    'lol/champion-mastery/v4/champion-masteries/by-summoner/';
final String championSummaryPath = 'https://raw.communitydragon.org/pbe/plugins/rcp-be-lol-game-data/global/cs_cz/v1/champion-summary.json';

Future<List<Champion>> getChampionMasteryBySummonerName(
    encryptedSummonerName) async {

  List<dynamic> decodedJson =
      await getListWebClient(championMasteryPath, param: encryptedSummonerName);

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

Future<List<ChampionSummary>> getChampionSummary() async {
  final Response response = await loggingInterceptor.getInterceptorClient().get(
      championSummaryPath
  );

  List<dynamic> listJson = jsonDecode(response.body);
  listJson.removeAt(0);

  return listJson.map((dynamic json){
     return ChampionSummary.fromJson(json);
  }).toList();
}

Future<ChampionDetail> getChampionDetail(String nameChamp, String version) async {
  String newString = nameChamp;

  //Por conta da inconsistência de dados vindos da Riot, esse IF se fez necessário, mesmo sendo uma gambiarra
  if(nameChamp == "FiddleSticks"){
    newString = 'Fiddlesticks';
  }

  final Response response = await loggingInterceptor.getInterceptorClient().get(
      'http://ddragon.leagueoflegends.com/cdn/10.9.1/data/pt_BR/champion/${newString}.json'
  );

  dynamic json = jsonDecode(response.body);
  Map<String, dynamic> json2 = json['data'][newString];

  return ChampionDetail.fromJson(json2);
}
