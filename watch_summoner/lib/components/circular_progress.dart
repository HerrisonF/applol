import 'package:flutter/material.dart';

class CircularProgress extends StatelessWidget {
  final String loadingText;

  CircularProgress({this.loadingText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            Text(
              loadingText != null ? loadingText : 'Carregando',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
