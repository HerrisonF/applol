import 'dart:convert';

import 'package:http/http.dart';
import 'package:watch_summoner/http/config/webclient.dart';
import 'package:watch_summoner/http/database/preferences/preferences.dart';

String versionPath = "https://ddragon.leagueoflegends.com/api/versions.json";

getVersionLol() async {
  final Response res =
      await loggingInterceptor.getInterceptorClient().get(versionPath);
  List<dynamic> json = jsonDecode(res.body);

  storeString("Version", json[0].toString());
}
