import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:watch_summoner/components/circular_progress.dart';
import 'package:watch_summoner/components/spell_text.dart';
import 'package:watch_summoner/http/http_champion.dart';
import 'package:watch_summoner/models/championDetail.dart';

class ChampionDetailScreen extends StatelessWidget {
  String nameChamp;

  ChampionDetailScreen(this.nameChamp);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ChampionDetail>(
      future: getChampionDetail(nameChamp),
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
              body: SingleChildScrollView(
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://raw.communitydragon.org/latest/game/assets/characters/${this.nameChamp.toLowerCase()}/skins/base/${this.nameChamp.toLowerCase()}loadscreen.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            Colors.blueGrey.withOpacity(0.0),
                            Colors.black,
                          ],
                          stops: [0.0, 0.5],
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                              right: 48.0,
                              left: 32.0,
                              top: MediaQuery.of(context).size.width / 1.7,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text(
                                      this.nameChamp,
                                      style: TextStyle(
                                        color: Colors.amber,
                                        fontSize: 32.0,
                                      ),
                                    ),
                                    Text(
                                      '- ${snapshot.data.title.toUpperCase()} -',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height /
                                        12.5,
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Image.network(
                                        'https://raw.communitydragon.org/latest/game/assets/ux/traiticons/trait_icon_2_${snapshot.data.tags[0].toLowerCase()}.png',
                                      ),
                                      Text(
                                        'Role',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      Text(
                                        '${snapshot.data.tags[0]}',
                                        style: TextStyle(
                                          color: Colors.amber,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 40.0),
                            width: MediaQuery.of(context).size.width,
                            height: 56.0,
                            child: Container(
                              child: Image.network(
                                  'https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-uikit/global/default/images/celebration-linework-mid.png'),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 16.0),
                              child: Text(
                                'STATS',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                padding:
                                    EdgeInsets.only(left: 16.0, bottom: 16.0),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Image.network(
                                          'https://raw.communitydragon.org/pbe/plugins/rcp-be-lol-game-data/global/default/v1/perk-images/statmods/statmodshealthscalingicon.png',
                                          height: 20.0,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'Health',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 24.0),
                                      child: Text(
                                        '${snapshot.data.stats.hp}',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 24.0),
                                      child: Text(
                                        '(+${snapshot.data.stats.hpperlevel} per level)',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding:
                                    EdgeInsets.only(right: 16.0, bottom: 16.0),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Image.asset(
                                          'assets/img/healthregen_icon.png',
                                          height: 20.0,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 24.0,
                                              left: 8.0,
                                              bottom: 8.0,
                                              top: 8.0),
                                          child: Text(
                                            'Health Regen',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '${snapshot.data.stats.hpregen}',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      '(+${snapshot.data.stats.hpregenperlevel} per level)',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 10.0,
                            child: Container(
                              child: Image.network(
                                  'https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-uikit/global/default/images/celebration-linework-outer.png'),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                padding:
                                    EdgeInsets.only(left: 16.0, bottom: 16.0),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Image.network(
                                          'https://raw.communitydragon.org/pbe/game/assets/perks/statmods/statmodsattackdamageicon.png',
                                          height: 20.0,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'Attack Damage',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 24.0),
                                      child: Text(
                                        '${snapshot.data.stats.attackdamage}',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 24.0),
                                      child: Text(
                                        '(+${snapshot.data.stats.attackdamageperlevel} per level)',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding:
                                    EdgeInsets.only(right: 16.0, bottom: 16.0),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Image.network(
                                          'https://raw.communitydragon.org/pbe/game/assets/perks/statmods/statmodsattackspeedicon.png',
                                          height: 20.0,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 24.0,
                                              left: 8.0,
                                              bottom: 8.0,
                                              top: 8.0),
                                          child: Text(
                                            'Attack Speed',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '${snapshot.data.stats.attackspeed}',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      '(+${snapshot.data.stats.attackspeedperlevel} per level)',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 10.0,
                            child: Container(
                              child: Image.network(
                                  'https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-uikit/global/default/images/celebration-linework-outer.png'),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                padding:
                                    EdgeInsets.only(left: 24.0, bottom: 16.0),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Image.network(
                                          'https://raw.communitydragon.org/pbe/game/assets/perks/statmods/statmodsmagicresicon.png',
                                          height: 20.0,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'Magic Resist',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 24.0),
                                      child: Text(
                                        '${snapshot.data.stats.spellblock}',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 24.0),
                                      child: Text(
                                        '(+${snapshot.data.stats.spellblockperlevel} per level)',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding:
                                    EdgeInsets.only(right: 24.0, bottom: 16.0),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Image.network(
                                          'https://raw.communitydragon.org/pbe/game/assets/perks/statmods/statmodsarmoricon.png',
                                          height: 20.0,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 24.0,
                                              left: 8.0,
                                              bottom: 8.0,
                                              top: 8.0),
                                          child: Text(
                                            'Armor',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '${snapshot.data.stats.armor}',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      '(+${snapshot.data.stats.armorperlevel} per level)',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 10.0,
                            child: Container(
                              child: Image.network(
                                  'https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-uikit/global/default/images/celebration-linework-outer.png'),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                padding:
                                    EdgeInsets.only(left: 16.0, bottom: 16.0),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Image.asset(
                                          'assets/img/mana_icon.png',
                                          height: 20.0,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'Mana',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 24.0),
                                      child: Text(
                                        '${snapshot.data.stats.mp}',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 24.0),
                                      child: Text(
                                        '(+${snapshot.data.stats.mpperlevel} per level)',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding:
                                    EdgeInsets.only(right: 16.0, bottom: 16.0),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Image.asset(
                                          'assets/img/manaregen_icon.png',
                                          height: 20.0,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 24.0,
                                              left: 8.0,
                                              bottom: 8.0,
                                              top: 8.0),
                                          child: Text(
                                            'Mana Regen',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '${snapshot.data.stats.mpregen}',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      '(+${snapshot.data.stats.mpregenperlevel} per level)',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 10.0,
                            child: Container(
                              child: Image.network(
                                  'https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-uikit/global/default/images/celebration-linework-outer.png'),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                padding:
                                    EdgeInsets.only(left: 16.0, bottom: 16.0),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Image.network(
                                          'https://raw.communitydragon.org/pbe/game/data/images/ui/floatingcombattext/criticon.png',
                                          height: 20.0,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'Crit',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 24.0),
                                      child: Text(
                                        '${snapshot.data.stats.crit}',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 24.0),
                                      child: Text(
                                        '(+${snapshot.data.stats.critperlevel} per level)',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding:
                                    EdgeInsets.only(right: 16.0, bottom: 16.0),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Image.asset(
                                          'assets/img/movespeed_icon.png',
                                          height: 20.0,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 24.0,
                                              left: 8.0,
                                              bottom: 8.0,
                                              top: 8.0),
                                          child: Text(
                                            'Move Speed',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '${snapshot.data.stats.movespeed}',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 8.0),
                            width: MediaQuery.of(context).size.width,
                            height: 26.0,
                            child: Container(
                              child: Image.network(
                                  'https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-uikit/global/default/images/celebration-linework-mid.png'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Passive - ${snapshot.data.passive.name}',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                          ),
                          Container(
                            child: Image.network(
                                'http://ddragon.leagueoflegends.com/cdn/10.5.1/img/passive/${snapshot.data.name}_P.png'),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Html(
                              data: utf8.decode(
                                '${snapshot.data.passive.description.replaceRange(snapshot.data.passive.description.indexOf('<'), snapshot.data.passive.description.indexOf('>') + 1, "")}'
                                    .runes
                                    .toList(),
                              ),
                              defaultTextStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 8.0),
                            width: MediaQuery.of(context).size.width,
                            height: 26.0,
                            child: Container(
                              child: Image.network(
                                  'https://raw.communitydragon.org/latest/plugins/rcp-fe-lol-uikit/global/default/images/celebration-linework-mid.png'),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 16.0),
                              child: Text(
                                'ABILITIES',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SpellText(
                              key: Key('championSpell'),
                              spells: snapshot.data.spells),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
            break;
        }
        return Text('unknow Error');
      },
    );
  }
}
