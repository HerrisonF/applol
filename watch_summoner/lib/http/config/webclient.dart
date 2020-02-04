import 'dart:convert';

import 'package:http/http.dart';
import 'Interceptor.dart';

final String baseUrl = 'https://br1.api.riotgames.com/';
final String token = 'RGAPI-5a712fad-dda0-4eb2-bd5f-855e896b0005';
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

Future<List<dynamic>> getListWebClient(path, param) async {

  final Response response = await loggingInterceptor.getInterceptorClient().get(
    baseUrl+path+param,
    headers: headers,
  );
  final List<dynamic> decodedJson = jsonDecode(response.body);

  return decodedJson;
}