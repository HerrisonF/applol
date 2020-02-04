import 'package:watch_summoner/http/config/webclient.dart';
import 'package:watch_summoner/models/ranked.dart';

final String path = 'lol/league/v4/entries/by-summoner/';
final String pathTFT = 'tft/league/v1/entries/by-summoner/';

Future<List<Ranked>> getRankedStats(String encryptedSummonerId) async {
  List<dynamic> decodedJson = await getWebClient(path, encryptedSummonerId);
  List<dynamic> decodedJsonTFT = await getWebClient(pathTFT, encryptedSummonerId);
  List<Ranked> rankeds = new List();

  rankeds = decodedJson.map(
    (dynamic json) {
      return Ranked.fromJson(json);
    },
  ).toList();

  rankeds.add(Ranked.fromJson(decodedJsonTFT[0]));

return rankeds;
}
