import 'package:watch_summoner/http/config/webclient.dart';
import 'package:watch_summoner/models/summoner.dart';

final String path = 'lol/summoner/v4/summoners/by-name/';

Future<Summoner> getSummonerCredentials(String summonerName) async {
  return Summoner.fromJson(await getWebClient(path, summonerName));
}



