import 'dart:convert';

import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'Interceptor.dart';

final String baseUrl = 'https://br1.api.riotgames.com/';
final String token = 'RGAPI-908a96dc-bca5-4a7b-b7b9-03e258a831d9';
final LoggingInterceptor loggingInterceptor = new LoggingInterceptor();

final Map<String, String> headers = {
  'Content-type': 'application/json',
  'X-Riot-Token': token
};

Future<dynamic> getWebClient(path, param) async {

  final Response response = await loggingInterceptor.getInterceptorClient().get(
    baseUrl+path+param,
    headers: headers,
  );
  final dynamic decodedJson = jsonDecode(response.body);

  return decodedJson;
}

Future<List<dynamic>> getListWebClient(path, {param}) async {

  final Response response = await loggingInterceptor.getInterceptorClient().get(
    baseUrl+path+param,
    headers: headers,
  );
  final List<dynamic> decodedJson = jsonDecode(response.body);

  return decodedJson;
}