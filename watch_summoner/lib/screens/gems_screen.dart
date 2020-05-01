import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:watch_summoner/components/circular_progress.dart';
import 'package:watch_summoner/components/removeHtmlTags.dart';
import 'package:watch_summoner/http/http_gem.dart';
import 'package:watch_summoner/models/gem.dart';

class GemsScreen extends StatefulWidget {
  @override
  _GemsScreenState createState() => _GemsScreenState();
}

class _GemsScreenState extends State<GemsScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Gem>>(
        future: getAllGems(),
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
                backgroundColor: Colors.black,
                body: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: <Widget>[
                        Card(
                          child: ExpansionTile(
                            title: Text('Precision'),
                            leading: Image.network(
                                'http://raw.communitydragon.org/pbe/game/assets/perks/styles/7201_precision.png'),
                            children: <Widget>[
                              ExpansionTile(
                                title: Text(snapshot.data[29].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/precision/presstheattack/presstheattack.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[29].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[22].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/precision/lethaltempo/lethaltempotemp.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[22].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[56].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/precision/fleetfootwork/fleetfootwork.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[56].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[24].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/precision/conqueror/conqueror.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[24].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[95].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/precision/overheal.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[95].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[40].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/precision/triumph.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[40].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[69].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/precision/presenceofmind/presenceofmind.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[69].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[71].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/precision/legendalacrity/legendalacrity.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[71].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[23].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/precision/legendtenacity/legendtenacity.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[23].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[60].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/precision/legendbloodline/legendbloodline.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[60].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[54].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/precision/${snapshot.data[54].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[54].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[54].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[26].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/precision/${snapshot.data[26].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[26].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[26].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[7].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/sorcery/${snapshot.data[7].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[7].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[7].longDesc)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Card(
                          child: ExpansionTile(
                            title: Text('Domination'),
                            leading: Image.network(
                                'http://raw.communitydragon.org/pbe/game/assets/perks/styles/7200_domination.png'),
                            children: <Widget>[
                              ExpansionTile(
                                title: Text(snapshot.data[8].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/domination/${snapshot.data[8].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[8].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[8].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[85].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/domination/${snapshot.data[85].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[85].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[85].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[13].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/domination/${snapshot.data[13].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[13].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[13].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[83].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/domination/${snapshot.data[83].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[83].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[83].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[1].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/domination/${snapshot.data[1].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[1].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[1].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[20].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/domination/${snapshot.data[20].name.toLowerCase().replaceAll(" ", "")}/greenterror_${snapshot.data[20].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[20].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[78].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/domination/${snapshot.data[78].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[78].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[78].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[88].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/domination/${snapshot.data[88].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[88].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[88].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[35].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/domination/${snapshot.data[35].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[35].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[35].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[76].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/domination/${snapshot.data[76].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[76].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[76].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[5].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/domination/${snapshot.data[5].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[5].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[5].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[36].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/domination/${snapshot.data[36].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[36].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[36].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[41].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/domination/${snapshot.data[41].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[41].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[41].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[25].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/domination/${snapshot.data[25].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[25].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[25].longDesc)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Card(
                          child: ExpansionTile(
                            title: Text('Sorcery'),
                            leading: Image.network(
                                'http://raw.communitydragon.org/pbe/game/assets/perks/styles/7202_sorcery.png'),
                            children: <Widget>[
                              ExpansionTile(
                                title: Text(snapshot.data[18].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/sorcery/${snapshot.data[18].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[18].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[18].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[93].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/sorcery/${snapshot.data[93].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[93].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[93].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[62].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/sorcery/${snapshot.data[62].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[62].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[62].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[27].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/sorcery/${snapshot.data[27].name.toLowerCase().replaceAll(" ", "")}/pokeshield.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[27].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[57].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/sorcery/${snapshot.data[57].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[57].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[57].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[43].name),
                                leading: Image.network(
                                    'https://raw.communitydragon.org/pbe/game/assets/perks/styles/sorcery/${snapshot.data[43].name.toLowerCase().replaceAll(" ", "")}/6361.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[43].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[28].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/sorcery/${snapshot.data[28].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[28].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[28].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[9].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/sorcery/${snapshot.data[9].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[9].name.toLowerCase().replaceAll(" ", "")}temp.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[9].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[86].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/sorcery/${snapshot.data[86].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[86].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[86].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[19].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/sorcery/${snapshot.data[19].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[19].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[19].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[6].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/sorcery/${snapshot.data[6].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[6].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[6].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[68].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/sorcery/${snapshot.data[68].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[68].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[68].longDesc)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Card(
                          child: ExpansionTile(
                            title: Text('Resolve'),
                            leading: Image.network(
                                'http://raw.communitydragon.org/pbe/game/assets/perks/styles/7204_resolve.png'),
                            children: <Widget>[
                              ExpansionTile(
                                title: Text(snapshot.data[82].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/resolve/${snapshot.data[82].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[82].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[82].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[45].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/resolve/veteran${snapshot.data[45].name.toLowerCase().replaceAll(" ", "")}/veteran${snapshot.data[45].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[45].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[75].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/resolve/${snapshot.data[75].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[75].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[75].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[0].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/resolve/${snapshot.data[0].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[0].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[0].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[65].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/resolve/${snapshot.data[65].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[65].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[65].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[39].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/resolve/mirrorshell/mirrorshell.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[39].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[84].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/resolve/${snapshot.data[84].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[84].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[84].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[80].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/resolve/${snapshot.data[80].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[80].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[80].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[16].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/resolve/${snapshot.data[16].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[16].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[16].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[58].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/resolve/${snapshot.data[58].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[58].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[58].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[10].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/resolve/${snapshot.data[10].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[10].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[10].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[38].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/sorcery/${snapshot.data[38].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[38].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[38].longDesc)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Card(
                          child: ExpansionTile(
                            title: Text('Inspiration'),
                            leading: Image.network(
                                'http://raw.communitydragon.org/pbe/game/assets/perks/styles/7203_whimsy.png'),
                            children: <Widget>[
                              ExpansionTile(
                                title: Text(snapshot.data[37].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/inspiration/${snapshot.data[37].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[37].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[37].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[11].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/inspiration/${snapshot.data[11].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[11].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[11].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[89].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/inspiration/masterkey/masterkey.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[89].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[74].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/inspiration/${snapshot.data[74].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[74].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[74].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[67].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/inspiration/${snapshot.data[67].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[67].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[67].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[59].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/inspiration/${snapshot.data[59].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[59].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[59].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[2].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/inspiration/${snapshot.data[2].name.toLowerCase().replaceAll(" ", "").replaceAll("'", "")}/${snapshot.data[2].name.toLowerCase().replaceAll(" ", "").replaceAll("'", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[2].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[64].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/inspiration/${snapshot.data[64].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[64].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[64].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[79].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/inspiration/${snapshot.data[79].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[79].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[79].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[91].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/inspiration/${snapshot.data[91].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[91].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[91].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[4].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/resolve/${snapshot.data[4].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[4].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[4].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[33].name),
                                leading: Image.network(
                                    'http://raw.communitydragon.org/pbe/game/assets/perks/styles/inspiration/${snapshot.data[33].name.toLowerCase().replaceAll(" ", "")}/${snapshot.data[33].name.toLowerCase().replaceAll(" ", "")}.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[33].longDesc)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Card(
                          child: ExpansionTile(
                            title: Text(
                              'Perks',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            children: <Widget>[
                              ExpansionTile(
                                title: Text(snapshot.data[49].name),
                                leading: Image.network(
                                    'https://raw.communitydragon.org/pbe/game/assets/perks/statmods/statmodsadaptiveforceicon.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[49].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[47].name),
                                leading: Image.network(
                                    'https://raw.communitydragon.org/pbe/game/assets/perks/statmods/statmodsarmoricon.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[47].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[34].name),
                                leading: Image.network(
                                    'https://raw.communitydragon.org/pbe/game/assets/perks/statmods/statmodsmagicresicon.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[34].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[55].name),
                                leading: Image.network(
                                    'https://raw.communitydragon.org/pbe/game/assets/perks/statmods/statmodscdrscalingicon.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[55].longDesc)),
                                  ),
                                ],
                              ),
                              ExpansionTile(
                                title: Text(snapshot.data[52].name),
                                leading: Image.network(
                                    'https://raw.communitydragon.org/pbe/game/assets/perks/statmods/statmodshealthscalingicon.png'),
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(removeAllHtmlTags(snapshot.data[52].longDesc)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              );
              break;
          }
          return Text('Erro Desconhecido');
        });
  }
}
