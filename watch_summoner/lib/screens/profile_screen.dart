import 'package:flutter/material.dart';
import 'package:watch_summoner/components/circular_progress.dart';
import 'package:watch_summoner/components/profile_screen_component.dart';
import 'package:watch_summoner/http/http_information.dart';
import 'package:watch_summoner/models/informationModel.dart';
import 'package:watch_summoner/models/summonerFavorite.dart';
import 'package:watch_summoner/http/database/dao/daoSummonerFavorite.dart';

class ProfileScreen extends StatelessWidget {

  final String summonerName;
  final String encryptedId;
  final SummonerFavoriteDAO _summonerFavoriteDAO = SummonerFavoriteDAO();

  ProfileScreen({this.summonerName, this.encryptedId});

  @override
  Widget build(BuildContext context) {
    _summonerFavoriteDAO.insertFavoriteSummoner(new SummonerFavorite(summonerName, encryptedId));
    return FutureBuilder<InformationModel>(
      future: getAllInformation(summonerName),
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
            return ProfileScreenComponent(snapshot.data);
            break;
        }
        return Text('Erro Desconhecido');
      },
    );
  }
}
