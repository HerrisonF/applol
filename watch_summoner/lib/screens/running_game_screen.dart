import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watch_summoner/components/active_game_profile_left.dart';
import 'package:watch_summoner/components/active_game_profile_right.dart';
import 'package:watch_summoner/components/circular_progress.dart';
import 'package:watch_summoner/http/http_match.dart';
import 'package:watch_summoner/models/banned_champion.dart';
import 'package:watch_summoner/models/participants.dart';
import 'package:watch_summoner/models/spectator.dart';

//Loop h6UARO0SNZAK49KzAXBz62m7qi9wHArsgHXZWcQ8nHIu
//tasheshi 3CgiebYP_HsUVS9XxyFFL-4clNKaZyLz1FlpKYRmQIYe
//Minerva RKSRrlp2qZtwER95YdZYHnEt_Q0bsWRo8g2CXAAjxcljcA
//TabeHiroKake QsbRQ0Frb_SDFp4LiwtjEke_MVT9vFL_YTK2QBgc6hPvdA0
//Bayek of siwa L75SfKSKeOiQMv4AVUkxo0M7pMc7Ly4pLG0UHlrwx-Hj
//baccbb aISzzA1V_m_-8YQjJa4YAhr1uPvntJy_X8FKGnYm9AtJs3w

//Ainda falta fazer o KDA e farm
class RunningGame extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Spectator>(
      future: getRunningGame('aISzzA1V_m_-8YQjJa4YAhr1uPvntJy_X8FKGnYm9AtJs3w'),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            // TODO: Handle this case.
            break;
          case ConnectionState.waiting:
            return CircularProgress();
            break;
          case ConnectionState.active:
            // TODO: Handle this case.
            break;
          case ConnectionState.done:
            return Scaffold(
              backgroundColor: Colors.amberAccent,
              body: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text('Banned Champions', style: TextStyle(
                      fontSize: 16.0,
                    ),),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.grey,
                      padding: EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
                      child: Wrap(
                        spacing: 32.0,
                        children: snapshot.data.bannedChampions.map((item) => Image.network('https://cdn.communitydragon.org/latest/champion/${item.championId}/square', height: 40.0, width: 40.0,)).toList().cast<Image>(),
                      ),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data.participants.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              getActiveGameContainer(
                                snapshot.data.participants[index],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    flex: 7,
                  ),
                ],
              ),
            );
            break;
        }
        return Text('UnknowError');
      },
    );
  }

  Widget getActiveGameContainer(Participants participant) {
    if (participant.teamId == 100) {
      return ActiveGameProfileRight(participant);
    } else {
      return ActiveGameProfileLeft(participant);
    }
  }
}
