import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:watch_summoner/models/spell.dart';

class SpellText extends StatefulWidget {
  final List<Spell> spells;

  const SpellText({Key key, this.spells}) : super(key: key);

  @override
  _SpellTextState createState() => _SpellTextState();
}

class _SpellTextState extends State<SpellText> {
  int indice = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 100.0,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.spells.length,
            itemBuilder: (BuildContext context, int index) {
              return MaterialButton(
                child: Image.network(
                    'https://cdn.communitydragon.org/latest/champion/107/ability-icon/${KeyType.values[index].toString().split('.').last}'),
                onPressed: () {
                  setState(
                    () {
                      indice = index;
                    },
                  );
                },
              );
            },
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Column(
            children: <Widget>[
              Text(
                '${widget.spells[indice].name}',
                style: TextStyle(color: Colors.amber, fontSize: 16.0),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Html(
                  data: utf8.decode(
                    '${widget.spells[indice].description.replaceRange(widget.spells[indice].description.indexOf('<'), widget.spells[indice].description.indexOf('>')+1, "")}'
                        .runes
                        .toList(),
                  ),
                  defaultTextStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
