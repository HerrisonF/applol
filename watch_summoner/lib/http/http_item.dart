
import 'dart:convert';

import 'package:http/http.dart';
import 'package:watch_summoner/http/config/webclient.dart';
import 'package:watch_summoner/models/item.dart';

String itemPath = 'http://ddragon.leagueoflegends.com/cdn/10.3.1/data/en_US/item.json';

Future<List<Item>> getAllItens() async {
  final Response response = await loggingInterceptor.getInterceptorClient().get(
    itemPath
  );

  final dynamic decodedJson = jsonDecode(response.body);
  Map<String, dynamic> list = decodedJson['data'];
  //Por se tratar de um objeto json sem array, tive q pegar cada elemento por sua chave,
  //com as chaves em mãos, fiz um foreach em um list de chave/valor para conseguir pegar o conteúdo dos objetos

  //list.keys.forEach((element)=> print('AQUI A LISTA-${list[element]}'));
//  List<Item> lista = new List();
//  list.keys.forEach((element)=>
//    lista.add(Item.fromJson(list[element]))
//  );


  return list.keys.map((json){
    return Item.fromJson(list[json], json);
  }).toList();
}