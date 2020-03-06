import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watch_summoner/models/participants.dart';

class ActiveGameProfileLeft extends StatelessWidget {

  Participants participants;

  ActiveGameProfileLeft(this.participants);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image.network(
                    'https://raw.communitydragon.org/pbe/game/data/spells/icons2d/${getString(participants.spell1Id)}.png',
                    height: 20.0,
                    width: 20.0,
                  ),
                  Image.network(
                    'https://raw.communitydragon.org/pbe/game/data/spells/icons2d/${getString(participants.spell2Id)}.png',
                    height: 20.0,
                    width: 20.0,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Image.network('https://cdn.communitydragon.org/latest/champion/${participants.championId}/square', width: 40.0, height: 40.0,),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text('190'),
                      Image.network(
                        'http://ddragon.leagueoflegends.com/cdn/5.5.1/img/ui/minion.png', height: 20.0,width: 20.0,),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text('9/0/4'),
                      Image.network(
                        'https://raw.communitydragon.org/pbe/game/assets/perks/statmods/statmodsattackdamageicon.png', height: 20.0,width: 20.0,),
                    ],
                  ),
                ],
              ),
              Text(participants.summonerName),
            ],
          )
      ),
    );
  }

  String getString(int number){
    if(number==4){
      return 'summoner_flash';
    }else if(number == 14){
      return 'summonerignite';
    }else if(number==7){
      return 'summoner_heal';
    }else if(number==11){
      return 'summoner_smite';
    }else if(number == 3){
      return 'summoner_exhaust';
    }else if(number == 6){
      return 'summoner_haste';
    }else if(number==12){
      return 'summoner_teleport';
    }
  }
}
