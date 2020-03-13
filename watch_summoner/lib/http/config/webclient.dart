import 'dart:convert';

import 'package:http/http.dart';
import 'Interceptor.dart';

final String baseUrl = 'https://br1.api.riotgames.com/';
final String token = 'RGAPI-e8fc52b2-6b69-47fa-acdf-9de0a7e65f20';
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