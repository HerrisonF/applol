import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watch_summoner/components/active_game_profile_left.dart';
import 'package:watch_summoner/components/active_game_profile_right.dart';
import 'package:watch_summoner/components/circular_progress.dart';
import 'package:watch_summoner/http/database/dao/daoSummonerFavorite.dart';
import 'package:watch_summoner/http/http_match.dart';
import 'package:watch_summoner/models/participants.dart';
import 'package:watch_summoner/models/spectator.dart';
import 'package:watch_summoner/models/summonerFavorite.dart';

//Ainda falta fazer o KDA e farm
class RunningGameScreen extends StatelessWidget {

  String summonerName;
  final String encryptedId;
  final SummonerFavoriteDAO _summonerFavoriteDAO = SummonerFavoriteDAO();

  RunningGameScreen({Key key, this.summonerName, this.encryptedId}):super(key: key);

  @override
  Widget build(BuildContext context) {
    _summonerFavoriteDAO.insertFavoriteSummoner(new SummonerFavorite(summonerName, encryptedId));
    return FutureBuilder<Spectator>(
      future: getRunningGame(summonerName),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
              return Container(
                child: Text('Não encontrado'),
              );
            break;
          case ConnectionState.waiting:
            return CircularProgress();
            break;
          case ConnectionState.active:
            // TODO: Handle this case.
            break;
          case ConnectionState.done:
            if(snapshot.data != null && snapshot.data.gameId != null) {
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
            }else{
              return Container(
                child: Text('Não encontrado'),
              );
            }
            break;
        }
        return Text('Houve algum problema :(');
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
