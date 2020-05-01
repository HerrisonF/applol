import 'dart:convert';

import 'package:http/http.dart';
import 'Interceptor.dart';

final String baseUrl = 'https://br1.api.riotgames.com/';
final String token = 'RGAPI-2b15a8df-dda9-4452-9876-984032447537';
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