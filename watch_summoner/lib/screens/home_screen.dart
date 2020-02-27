import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:watch_summoner/screens/champion_detail_screen.dart';

import 'package:watch_summoner/screens/champions_screen.dart';
import 'package:watch_summoner/screens/gems_screen.dart';
import 'package:watch_summoner/screens/itens_screen.dart';
import 'package:watch_summoner/screens/summoners_screen.dart';
import 'package:watch_summoner/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  var selectedItem = 0;

  List children = [
    //SummonersScreen(),
    //ItensScreen(),
    //GemsScreen(),
    //ChampionsScreen(),
    ChampionDetailScreen('Ryze'),
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF202020),
      body: children[selectedItem],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.grey[800],
        animationCurve: Curves.linearToEaseOut,
        height: 65.0,
        color: Theme.of(context).primaryColor,
        items: tabItems,
        onTap: (index){
          setState(() {
            selectedItem = index;
          });
        },
      ),
    );
  }

}
