import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SummonersScreen extends StatefulWidget {
  @override
  _SummonersScreenState createState() => _SummonersScreenState();
}

class _SummonersScreenState extends State<SummonersScreen> {
  TextEditingController jogoAndamentoController = new TextEditingController();
  TextEditingController perfilController = new TextEditingController();
  bool isProfileCheckBox = true;
  String summonerName = '';

  @override
  void initState() {
    super.initState();
  }

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
                controller: jogoAndamentoController,
                textInputAction: TextInputAction.search,
                onSubmitted: (a) {},
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
                      print('Clicou no sufixo');
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: 32.0, left: 0.0, right: 0.0, bottom: 0.0),
                child: Text(
                  'Recents',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height/1.62,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 20,
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
                                      'Houtebeen',
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
                                        ],),
                                    ),
                                  )
                                ],
                              ),
                              onTap: () {
                                //procura o profile, como se tivesse pesquisado
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
                          borderRadius: BorderRadius.circular(11.0)),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
