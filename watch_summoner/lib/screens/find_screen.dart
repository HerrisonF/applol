import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:watch_summoner/components/summonerFavorites.dart';
import 'package:watch_summoner/screens/profile_screen.dart';
import 'package:watch_summoner/screens/running_game_screen.dart';

class FindScreen extends StatefulWidget {
  @override
  _FindScreenState createState() => _FindScreenState();
}

enum OptionGame { profile, runningGame }

OptionGame _option = OptionGame.profile;

class _FindScreenState extends State<FindScreen> {
  TextEditingController textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.amber,
          height: MediaQuery.of(context).size.height - 60, // O -60 vem do tamanho da TabBar
          padding:
              EdgeInsets.only(top: 64.0, right: 16.0, left: 16.0, bottom: 0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: textController,
                textInputAction: TextInputAction.search,
                cursorColor: Theme.of(context).accentColor,
                decoration: InputDecoration(
                  hintText: 'Nome de invocador',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Theme.of(context).accentColor,
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
                onSubmitted: (value) {
                  //clique de search no keyboard
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
              ), //Caixa de Texto para a pesquisa de invocador
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 7, right: MediaQuery.of(context).size.width/7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Text('Perfil'),
                          Radio(
                            value: OptionGame.profile,
                            groupValue: _option,
                            onChanged: (OptionGame value) {
                              setState(() {
                                _option = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Text('Partida'),
                          Radio(
                            value: OptionGame.runningGame,
                            groupValue: _option,
                            onChanged: (OptionGame value) {
                              setState(() {
                                _option = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),// Linha com os Radios
              Container(
                margin: EdgeInsets.only(
                    top: 26.0, left: 0.0, right: 0.0, bottom: 0.0),
                child: Text(
                  'Recentes',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ), // Linha com o texto recentes
              Expanded(
                child: SummonerFavorites(_option),
              ), //Linha contendo a Lista de recentes
            ],
          ),
        ),
      ),
    );
  }
}
