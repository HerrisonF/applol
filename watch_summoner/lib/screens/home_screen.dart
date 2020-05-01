import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:watch_summoner/components/circular_progress.dart';
import 'package:watch_summoner/http/database/preferences/preferences.dart';
import 'package:watch_summoner/http/http_version.dart';
import 'package:watch_summoner/screens/find_screen.dart';

import 'champions_screen.dart';
import 'gems_screen.dart';
import 'itens_screen.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  var selectedItem = 0;

  List children = [
    //FindScreen(),
    //ItensScreen(),
    //GemsScreen(),
    ChampionsScreen(),
  ];

  List<Widget> tabItems = List.of([
    //Icon(Icons.search, size: 30),
    //Icon(Icons.adb, size: 30),
    //Icon(Icons.list, size: 30),
    Icon(Icons.compare_arrows, size: 30),
  ]);

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    SystemChrome.setEnabledSystemUIOverlays([]);
    getVersionLol();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getString("Version"),
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
              backgroundColor: Color(0xFF202020),
              body: children[selectedItem],
              bottomNavigationBar: CurvedNavigationBar(
                backgroundColor: Colors.amber,
                animationCurve: Curves.linearToEaseOut,
                height: 60.0,
                color: Theme.of(context).primaryColor,
                items: tabItems,
                onTap: (index) {
                  setState(
                    () {
                      selectedItem = index;
                    },
                  );
                },
              ),
            );
            break;
        }
        return Text("Erro desconhecido");
      },
    );
  }
}
