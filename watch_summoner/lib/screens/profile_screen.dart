import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:watch_summoner/components/circular_progress.dart';
import 'package:watch_summoner/http/http_information.dart';
import 'package:watch_summoner/models/informationModel.dart';
import 'package:watch_summoner/models/ranked.dart';
import 'package:watch_summoner/screens/detail_match_screen.dart';

class ProfileScreen extends StatelessWidget {
  final String summonerName;

  ProfileScreen(this.summonerName);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<InformationModel>(
      future:
          getAllInformation(summonerName != '' ? summonerName : 'houtebeen'),
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
              backgroundColor: Colors.white70,
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        _BackgroundCircularImageChampion(snapshot.data),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: IconButton(
                                icon: Icon(Icons.arrow_back),
                                color: Colors.white,
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                              ),
                            )
                          ],
                        ),
                        _BadgeProfileIcon(snapshot.data),
                        _TextSummonerName(snapshot.data),
                        _TextSummonerLevel(snapshot.data),
                        _TextSummonerRegion(snapshot.data),
                        _TextSummonerKDA(snapshot.data),
                        _BadgeRankSummoner(snapshot.data),
                        _TextRankSummoner(),
                      ],
                    ),
                    _TopSummonerChamps(snapshot.data),
                    SizedBox(
                      height: 45.0,
                    ),
                    _TextLastGames(),
                    _LastGamesScroll(snapshot.data),
                  ],
                ),
              ),
            );
            break;
        }
        return Text('Unknown Error');
      },
    );
  }
}

class _TopSummonerChamps extends StatelessWidget {
  final InformationModel informationModel;

  _TopSummonerChamps(this.informationModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      height: 120.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(15.0),
            width: 90.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.black,
              image: DecorationImage(
                image: NetworkImage(
                    'https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/v1/champion-icons/${informationModel.champions[index].id}.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  transform: Matrix4.translationValues(20.0, 50.0, 0.0),
                  child: Image(
                    image: NetworkImage(
                        'https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-profiles/global/default/mastery_level${informationModel.champions[index].level}.png'),
                    width: 50.0,
                    height: 50.0,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _LastGamesScroll extends StatelessWidget {
  final InformationModel informationModel;

  _LastGamesScroll(this.informationModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(top: 15.0),
      height: 200.0,
      child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: informationModel.lastPlayedGame.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
            padding: EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Container(
                      height: 200.0,
                      width: 140.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: Colors.black,
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/v1/champion-icons/${informationModel.lastPlayedGame[index].champion}.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 5.0),
                        width: 140.0,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Vitória',
                            style: TextStyle(
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  blurRadius: 3.0,
                                ),
                              ],
                              color: Colors.orange,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(bottom: 5.0),
                        width: 140.0,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            '${informationModel.lastPlayedGame[index].timestamp}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  blurRadius: 3.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailMatchScreen(
                        informationModel.lastPlayedGame[index].gameId,
                        informationModel.lastPlayedGame[index].champion),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _TextLastGames extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        'Últimas Partidas',
        style: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
            fontFamily: "SF-Pro-Text-Regular"),
      ),
    );
  }
}

class _BadgeRankSummoner extends StatelessWidget {
  final InformationModel informationModel;

  _BadgeRankSummoner(this.informationModel);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              transform: Matrix4.translationValues(15.0, -40.0, 0.0),
              child: Hero(
                tag: 'tft_elo_picture',
                child: ClipShadowPath(
                  shadow: Shadow(blurRadius: 16.0),
                  clipper: CircularClipper(),
                  child: Container(
                    height: 75.0,
                    width: 66.0,
                    child: Image.network(
                      getBadgeString(informationModel.rankedSts, 'TFT'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -10.0, 0.0),
              child: Hero(
                tag: 'soloduo_elo_picture',
                child: ClipShadowPath(
                  shadow: Shadow(blurRadius: 16.0),
                  clipper: CircularClipper(),
                  child: Container(
                    height: 75.0,
                    width: 66.0,
                    child: Image.network(
                      getBadgeString(informationModel.rankedSts, 'SOLO'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              transform: Matrix4.translationValues(-15.0, -40.0, 0.0),
              child: Hero(
                tag: 'flex_elo_picture',
                child: ClipShadowPath(
                  shadow: Shadow(blurRadius: 16.0),
                  clipper: CircularClipper(),
                  child: Container(
                    height: 75.0,
                    width: 66.0,
                    child: Image.network(
                      getBadgeString(informationModel.rankedSts, 'FLEX'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getBadgeString(List<Ranked> rankedSts, String queue) {
    String badgeUrl = '';
    for (int i = 0; i < rankedSts.length; i++) {
      if (rankedSts[i].queueType.contains(queue)) {
        badgeUrl =
            'http://raw.communitydragon.org/pbe/game/assets/ux/tftmobile/particles/tft_regalia_${informationModel.rankedSts[i].tier}.tftm.png';
        break;
      }
      ;
    }
    if (badgeUrl == '') {
      badgeUrl =
          'http://raw.communitydragon.org/pbe/plugins/rcp-fe-lol-profiles/global/default/profile_unranked.png';
    }
    return badgeUrl;
  }
}

class _TextRankSummoner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              transform: Matrix4.translationValues(33.0, -15.0, 0.0),
              child: Text('TFT'),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, 15.0, 0.0),
              child: Text('Solo/Duo'),
            ),
            Container(
              transform: Matrix4.translationValues(-33.0, -15.0, 0.0),
              child: Text('5x5'),
            )
          ],
        ),
      ),
    );
  }
}

class _TextSummonerKDA extends StatelessWidget {
  final InformationModel informationModel;

  _TextSummonerKDA(this.informationModel);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          transform: Matrix4.translationValues(110.0, -50.0, 0.0),
          child: getTextKDASoloQueue(informationModel.rankedSts),
        ),
      ),
    );
  }

  Widget getTextKDASoloQueue(List<Ranked> rankedSts) {
    String kda = '';
    for (int i = 0; i < rankedSts.length; i++) {
      if (rankedSts[i].queueType.contains('SOLO')) {
        kda =
            '     KDA\n   6 | 5 | 8 \n ${rankedSts[i].wins}W - ${rankedSts[i].losses}L';
        break;
      }
    }
    return Text(
      kda,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      ),
    );
  }
}

class _TextSummonerRegion extends StatelessWidget {
  final InformationModel informationModel;

  _TextSummonerRegion(this.informationModel);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          transform: Matrix4.translationValues(-110.0, -70.0, 0.0),
          child: Text(
            'Brasil',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}

class _TextSummonerLevel extends StatelessWidget {
  final InformationModel informationModel;

  _TextSummonerLevel(this.informationModel);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          transform: Matrix4.translationValues(-110.0, -40.0, 0.0),
          child: Text(
            'Nivel ${informationModel.summoner.level}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}

class _BackgroundCircularImageChampion extends StatelessWidget {
  final InformationModel informationModel;

  _BackgroundCircularImageChampion(this.informationModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0.0, -50.0, 0.0),
      child: Container(
        height: 250.0,
        width: double.infinity,
        child: Hero(
          tag: 'profile_picture',
          child: ClipShadowPath(
            shadow: Shadow(blurRadius: 0.0),
            clipper: CircularClipper(),
            child: Opacity(
              opacity: 0.4,
              child: Image.network(
                'https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/v1/champion-splashes/${informationModel.champions[0].id}/${informationModel.champions[0].id}000.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BadgeProfileIcon extends StatelessWidget {
  final InformationModel informationModel;

  _BadgeProfileIcon(this.informationModel);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          transform: Matrix4.translationValues(0.0, -65.0, 0.0),
          child: ClipShadowPath(
            shadow: Shadow(blurRadius: 10.0, color: Colors.white),
            clipper: CircularClipper(),
            child: Image.network(
              'https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/v1/profile-icons/${informationModel.summoner.iconId}.jpg',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class _TextSummonerName extends StatelessWidget {
  final InformationModel informationModel;

  _TextSummonerName(this.informationModel);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          transform: Matrix4.translationValues(0.0, 1.0, 0.0),
          child: Text(
            informationModel.summoner.name,
            style: TextStyle(
              color: Colors.orange,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class CircularClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 50);
    path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height,
    );
    path.quadraticBezierTo(
      size.width - size.width / 4,
      size.height,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

@immutable
class ClipShadowPath extends StatelessWidget {
  final Shadow shadow;
  final CustomClipper<Path> clipper;
  final Widget child;

  ClipShadowPath({
    @required this.shadow,
    @required this.clipper,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClipShadowShadowPainter(
        clipper: this.clipper,
        shadow: this.shadow,
      ),
      child: ClipPath(child: child, clipper: this.clipper),
    );
  }
}

class _ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowShadowPainter({@required this.shadow, @required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
