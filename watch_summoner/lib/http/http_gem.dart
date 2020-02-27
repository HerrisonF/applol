import 'dart:convert';

import 'package:http/http.dart';
import 'package:watch_summoner/http/config/webclient.dart';
import 'package:watch_summoner/models/gem.dart';

final String path = 'https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/v1/perks.json';

Future<List<Gem>> getAllGems() async {

  final Response response = await loggingInterceptor.getInterceptorClient().get(
    path,
  );

  final List<dynamic> decodedJson = jsonDecode(response.body);

  return decodedJson.map((dynamic json){
    return Gem.fromJson(json);
  }).toList();
}