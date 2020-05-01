import 'package:flutter/material.dart';
import 'package:watch_summoner/screens/home_screen.dart';

void main() => runApp(LoLSummoner());

class LoLSummoner extends StatelessWidget {

  final theme = ThemeData(
    primaryColor: Color(0xFF212121),
    accentColor: Color(0xFFff6f00),
    iconTheme: IconThemeData(color: Colors.orange)
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new HomeScreen(),
      theme: theme,
    );
  }
}
