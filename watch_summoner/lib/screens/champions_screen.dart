import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:watch_summoner/components/circular_progress.dart';
import 'package:watch_summoner/http/http_champion.dart';
import 'package:watch_summoner/models/ChampionSummary.dart';
import 'package:watch_summoner/models/champion.dart';
import 'package:watch_summoner/screens/champion_detail_screen.dart';

class ChampionsScreen extends StatefulWidget {
  @override
  _ChampionsScreenState createState() => _ChampionsScreenState();
}

class _ChampionsScreenState extends State<ChampionsScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ChampionSummary>>(
      future: getChampionSummary(),
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
                  return InkWell(
                    child: Card(
                      elevation: 2.0,
                      child: Row(
                        children: <Widget>[
                          Image.network('https://cdn.communitydragon.org/latest/champion/${snapshot.data[index].id}/square', width: 70.0, height: 70.0,),
                          Container(
                            margin: EdgeInsets.all(8.0),
                            child: Text(utf8.decode(snapshot.data[index].name.runes.toList())),
                          ),
                        ],
                      )
                    ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChampionDetailScreen(snapshot.data[index].name)));
                    },
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

//  ExpansionTile(
//  subtitle: getRoles(
//  snapshot.data[index],
//  ),
//  leading: ClipRRect(
//  borderRadius: BorderRadius.circular(8.0),
//  child: Image.network(
//  'https://cdn.communitydragon.org/latest/champion/${snapshot.data[index].id}/square'),
//  ),
//  title: Text(utf8.decode(snapshot.data[index].name.runes.toList())),
//  ),

  Text getRoles(ChampionSummary snapshot) {
    String role = '';
    for (int i = 0; i < snapshot.roles.length; i++) {
      role = role + snapshot.roles[i].toString() + ',';
    }
    role = role.substring(0, role.length-1);
    return Text(utf8.decode(role.runes.toList()));
  }
}
