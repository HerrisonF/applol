import 'dart:convert';

import 'package:http/http.dart';
import 'package:watch_summoner/http/config/webclient.dart';
import 'package:watch_summoner/models/lastPlayedGame.dart';

final path = 'lol/match/v4/matchlists/by-account/';

Future<List<LastPlayedGame>> getLastPlayedGames(
    String encryptedAccountId) async {
  final Response response = await loggingInterceptor.getInterceptorClient().get(
    baseUrl+path+encryptedAccountId,
    headers: headers,
  );

  final dynamic decodedJson = jsonDecode(response.body);
  final List<dynamic> list = decodedJson['matches'];
  return list.map(
    (dynamic json) {
      return LastPlayedGame.fromJson(json);
    },
  ).toList();
}
