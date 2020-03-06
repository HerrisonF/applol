import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:watch_summoner/components/circular_progress.dart';
import 'package:watch_summoner/http/http_item.dart';
import 'package:watch_summoner/models/item.dart';

class ItensScreen extends StatefulWidget {
  @override
  _ItensScreenState createState() => _ItensScreenState();
}

class _ItensScreenState extends State<ItensScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Item>>(
      future: getAllItens(),
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
              body: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          //aqui o nome, descrição e efeito
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: ExpansionTile(
                              subtitle: Text(utf8.decode(snapshot
                                  .data[index].plaintext.runes
                                  .toList())),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  'http://ddragon.leagueoflegends.com/cdn/10.3.1/img/item/${snapshot.data[index].id}.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(utf8.decode(
                                  snapshot.data[index].name.runes.toList())),
                              children: <Widget>[
                                Container(
                                  child: Padding(
                                    padding: EdgeInsets.all(24.0),
                                    child: Html(
                                      data: utf8.decode(
                                        snapshot.data[index].description
                                        .replaceRange(snapshot.data[index].description.indexOf('<'), snapshot.data[index].description.indexOf('>')+1, "")
                                            .runes
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.grey[200],
                                ),
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
        return Text('Unknown Error');
      },
    );
  }
}
