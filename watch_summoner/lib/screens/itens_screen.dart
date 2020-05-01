import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:watch_summoner/components/circular_progress.dart';
import 'package:watch_summoner/components/removeHtmlTags.dart';
import 'package:watch_summoner/http/database/preferences/preferences.dart';
import 'package:watch_summoner/http/http_item.dart';
import 'package:watch_summoner/models/item.dart';

class ItensScreen extends StatefulWidget {
  @override
  _ItensScreenState createState() => _ItensScreenState();
}

class _ItensScreenState extends State<ItensScreen> {
  String version = "";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
        future: getString("Version"),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return CircularProgress();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              version = snapshot.data;
              return FutureBuilder<List<Item>>(
                future: getAllItens(version),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      break;
                    case ConnectionState.waiting:
                      return CircularProgress();
                      break;
                    case ConnectionState.active:
                      break;
                    case ConnectionState.done:
                      return Scaffold(
                        backgroundColor: Colors.amber,
                        body: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: ExpansionTile(
                                        subtitle: Text(
                                          utf8.decode(
                                            snapshot.data[index].plaintext.runes
                                                .toList(),
                                          ),
                                        ),
                                        leading: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            'http://ddragon.leagueoflegends.com/cdn/$version/img/item/${snapshot.data[index].id}.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ), //Imagem do Item
                                        title: Text(
                                          utf8.decode(
                                            snapshot.data[index].name.runes
                                                .toList(),
                                          ),
                                        ), //Nome do Item
                                        children: <Widget>[
                                          Container(
                                            child: Padding(
                                              padding: EdgeInsets.all(24.0),
                                              child: Text(removeAllHtmlTags(snapshot.data[index].description)),
                                            ),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            color: Colors.grey[200],
                                          ), //Descrição do Item
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                      break;
                  }
                  return Text('Erro desconhecido');
                },
              );
              break;
          }
          return Text("Erro desconhecido");
        });
  }

//  List<int> removeAllHtmlTags(String htmlText) {
//    RegExp exp = RegExp(
//        r"<[^>]*>",
//        multiLine: true,
//        caseSensitive: true
//    );
//
//    return htmlText.replaceAll(exp,'').runes.toList();
//  }
}
