import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:watch_summoner/components/summonerFavorites.dart';
import 'package:watch_summoner/http/database/database.dart';
import 'package:watch_summoner/models/summonerFavorite.dart';
import 'package:watch_summoner/screens/profile_screen.dart';
import 'package:watch_summoner/screens/running_game_screen.dart';

class SummonersScreen extends StatefulWidget {
  @override
  _SummonersScreenState createState() => _SummonersScreenState();
}

enum OptionGame { profile, runningGame }

OptionGame _option = OptionGame.profile;

class _SummonersScreenState extends State<SummonersScreen> {
  TextEditingController textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.amber,
          height: MediaQuery.of(context).size.height - 65,
          padding:
              EdgeInsets.only(top: 64.0, right: 16.0, left: 16.0, bottom: 0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: textController,
                textInputAction: TextInputAction.search,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText: 'Summoner Name',
                  border: OutlineInputBorder(),
                  hintStyle: TextStyle(color: Colors.white),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      if (_option == OptionGame.profile) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => new ProfileScreen(
                              summonerName: textController.text,
                            ),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => new RunningGameScreen(
                              summonerName: textController.text,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
                onSubmitted: (value){//clique de search no keyboard
                  if (_option == OptionGame.profile) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => new ProfileScreen(
                          summonerName: textController.text,
                        ),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => new RunningGameScreen(
                          summonerName: textController.text,
                        ),
                      ),
                    );
                  }
                },
              ),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 8),
                child: Row(
                  children: <Widget>[
                    Text('Profile'),
                    Container(
                      child: Radio(
                        value: OptionGame.profile,
                        groupValue: _option,
                        onChanged: (OptionGame value) {
                          setState(() {
                            _option = value;
                          });
                        },
                      ),
                    ),
                    Text('Running game'),
                    Container(
                      child: Radio(
                        value: OptionGame.runningGame,
                        groupValue: _option,
                        onChanged: (OptionGame value) {
                          setState(() {
                            _option = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 26.0, left: 0.0, right: 0.0, bottom: 0.0),
                child: Text(
                  'Recents',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: SummonerFavorites(_option),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
