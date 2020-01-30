import 'dart:convert';

import 'package:http/http.dart';
import 'Interceptor.dart';

final String baseUrl = 'https://br1.api.riotgames.com/';
final String token = 'RGAPI-9b25a7fb-565a-4c67-8142-5ef7abaf475a';
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