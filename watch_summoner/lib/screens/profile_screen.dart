import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:watch_summoner/components/circular_progress.dart';
import 'package:watch_summoner/http/http_summoner.dart';
import 'package:watch_summoner/models/data.dart';
import 'dart:math';

import 'package:watch_summoner/models/summoner.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

//Variaveis usadas no cardScroll
var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;
//

class _ProfileScreenState extends State<ProfileScreen> {
  var currentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    return FutureBuilder<Summoner>(
      future: getSummonerCredentials('houtebeen'),
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
            final Summoner summoner = snapshot.data;
            return Container(
              child: Scaffold(
                backgroundColor: Colors.white70,
                body: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          _BackgroundCircularImageChampion(),
                          _BadgeProfileIcon(summoner),
                          _TextSummonerName(summoner),
                          _TextSummonerLevel(summoner),
                          _TextSummonerRegion(summoner),
                          _TextSummonerKDA(summoner),
                          _BadgeRankSummoner(summoner),
                          _TextRankSummoner(),
                        ],
                      ),
                      _TopSummonerChamps(summoner),
                      SizedBox(
                        height: 45.0,
                      ),
                      _TextLastGames(),
                      _CardScrollLastGames(currentPage, controller),
                    ],
                  ),
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
  final Summoner summoner;

  _TopSummonerChamps(this.summoner);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(10.0),
            width: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage('assets/img/Aatrox_8.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  transform: Matrix4.translationValues(25.0, 40.0, 0.0),
                  child: Image(
                    image: AssetImage('assets/img/masteryIcon.png'),
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

class _CardScrollLastGames extends StatelessWidget {
  final currentPage;
  final PageController controller;

  _CardScrollLastGames(this.currentPage, this.controller);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CardScrollWidget(currentPage),
        Positioned.fill(
          child: PageView.builder(
            itemCount: images.length,
            controller: controller,
            reverse: true,
            itemBuilder: (context, index) {
              return Container();
            },
          ),
        )
      ],
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
  final Summoner summoner;

  _BadgeRankSummoner(this.summoner);

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
                  child: Image(
                    height: 75.0,
                    width: 66.0,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/img/Emblem_Bronze.png'),
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
                  child: Image(
                    height: 75.0,
                    width: 66.0,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/img/Emblem_Challenger.png'),
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
                  child: Image(
                    height: 75.0,
                    width: 66.0,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/img/Emblem_Bronze.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
  final Summoner summoner;

  _TextSummonerKDA(this.summoner);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          transform: Matrix4.translationValues(100.0, -50.0, 0.0),
          child: Text(
            '     KDA\n   6 | 5 | 8 \n 24W - 19L',
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

class _TextSummonerRegion extends StatelessWidget {
  final Summoner summoner;

  _TextSummonerRegion(this.summoner);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          transform: Matrix4.translationValues(-100.0, -70.0, 0.0),
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
  final Summoner summoner;

  _TextSummonerLevel(this.summoner);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          transform: Matrix4.translationValues(-100.0, -50.0, 0.0),
          child: Text(
            'Nivel ${summoner.level}',
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
  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0.0, -50.0, 0.0),
      child: Hero(
        tag: 'profile_picture',
        child: ClipShadowPath(
          shadow: Shadow(blurRadius: 20.0),
          clipper: CircularClipper(),
          child: Opacity(
            opacity: 0.4,
            child: Image(
              height: 250.0,
              width: double.infinity,
              fit: BoxFit.cover,
              image: AssetImage('assets/img/Aatrox_8.jpg'),
            ),
          ),
        ),
      ),
    );
  }
}

class _BadgeProfileIcon extends StatelessWidget {

  final Summoner summoner;

  _BadgeProfileIcon(this.summoner);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          transform: Matrix4.translationValues(0.0, -65.0, 0.0),
          child: ClipShadowPath(
            shadow: Shadow(blurRadius: 0.0, color: Colors.white),
            clipper: CircularClipper(),
            child: Image.network(
              'https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/v1/profile-icons/${summoner.iconId}.jpg',
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
  final Summoner summoner;

  _TextSummonerName(this.summoner);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          transform: Matrix4.translationValues(0.0, -2.0, 0.0),
          child: Text(
            summoner.name,
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

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 40.0;
  var verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, constraints) {
        var width = constraints.maxWidth;
        var heigth = constraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeigth = heigth - 2 * padding;

        var heigthOfPrimaryCard = safeHeigth;
        var widthOfPrimaryCard = heigthOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = new List();

        for (var i = 0; i < images.length; i++) {
          var delta = i - currentPage;
          var isOnRight = delta > 0;
          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);
          var cardItem = Positioned.directional(
            top: padding - 10.0 + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(3.0, 6.0),
                      blurRadius: 10.0)
                ]),
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(images[i], fit: BoxFit.cover),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 80.0, vertical: 8.0),
                              child: Text(
                                title[i],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontFamily: "SF-Pro-Text-Regular"),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, bottom: 12.0),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 22.0, vertical: 6.0),
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Text("Read",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
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
