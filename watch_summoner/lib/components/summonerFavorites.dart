import 'package:flutter/material.dart';
import 'package:watch_summoner/components/circular_progress.dart';
import 'package:watch_summoner/http/database/dao/daoSummonerFavorite.dart';
import 'package:watch_summoner/models/summonerFavorite.dart';
import 'package:watch_summoner/screens/profile_screen.dart';
import 'package:watch_summoner/screens/running_game_screen.dart';
import 'package:watch_summoner/screens/summoners_screen.dart';

class SummonerFavorites extends StatefulWidget {
  @override
  _SummonerFavoritesState createState() => _SummonerFavoritesState();

  OptionGame optionGame;

  SummonerFavorites(this.optionGame);


}

class _SummonerFavoritesState extends State<SummonerFavorites> {

  final SummonerFavoriteDAO _summonerFavoriteDAO = SummonerFavoriteDAO();

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<List<SummonerFavorite>>(
            initialData: List(),
            future: _summonerFavoriteDAO.findAllFavoriteSummoner(),
            builder: (context, snapshot){
              switch(snapshot.connectionState){
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
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          margin: EdgeInsets.only(bottom: 30.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: ListTile(
                                  leading: Image.network(
                                    'https://raw.communitydragon.org/latest/game/data/images/profileicons/profileicon3584.png',
                                    fit: BoxFit.cover,
                                  ),
                                  title: Stack(
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          snapshot.data[index].name,
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.orange,
                                            shadows: [
                                              Shadow(
                                                blurRadius: 5.0,
                                                color: Colors.black,
                                                offset: Offset(1.0, 2.0),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  onTap: () {
                                    if (widget.optionGame == OptionGame.profile) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => new ProfileScreen(
                                            summonerName: snapshot.data[index].name,
                                          ),
                                        ),
                                      );
                                    } else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => new RunningGameScreen(
                                            summonerName: snapshot.data[index].name,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/v1/champion-splashes/201/201003.jpg'),
                                    colorFilter: ColorFilter.linearToSrgbGamma(),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                height: 70.0,
                              )
                            ],
                          ),
                          elevation: 8.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11.0),
                          ),
                        );
                      });
                  break;
              }
              return Text('Unknow Error');
            });
  }
}
