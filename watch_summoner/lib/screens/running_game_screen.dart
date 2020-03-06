import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watch_summoner/components/active_game_profile_left.dart';
import 'package:watch_summoner/components/active_game_profile_right.dart';
import 'package:watch_summoner/components/circular_progress.dart';
import 'package:watch_summoner/http/http_match.dart';
import 'package:watch_summoner/models/participants.dart';
import 'package:watch_summoner/models/spectator.dart';

class RunningGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Spectator>(
      future: getRunningGame('sBvvhpM6QAoIkzyMv-OVSgGAS0J2FEo3JcnTpldBofJnyQ'),
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
              appBar: AppBar(
                title: Text(
                  snapshot.data.gameMode,
                ),
              ),
              body: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.linearToSrgbGamma(),
                    image: NetworkImage(
                        'https://raw.communitydragon.org/pbe/game/assets/loadingscreen/kingporobackground.png'),
                  ),
                ),
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
                                snapshot.data.participants[index]),
                          ],
                        ),
                      );
                    }),
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
