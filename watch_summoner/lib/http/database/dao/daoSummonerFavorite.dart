import 'package:sqflite/sqflite.dart';
import 'package:watch_summoner/http/database/database.dart';
import 'package:watch_summoner/models/summonerFavorite.dart';

class SummonerFavoriteDAO {
  static final String tableSQL = 'CREATE TABLE summoner('
      'id INTEGER PRIMARY KEY AUTOINCREMENT,'
      'name TEXT,'
      'encryptedId TEXT)';

  Future<int> insertFavoriteSummoner(SummonerFavorite summonerFavorite) async {
    final Database db = await getDatabase();

    if (await existOnFavorites(summonerFavorite)) {
      return 0;
    } else {
      return db.insert(
        'summoner',
        summonerFavorite.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<bool> existOnFavorites(SummonerFavorite summonerFavorite) async {

    List<SummonerFavorite> favorites = await findAllFavoriteSummoner();

    if (favorites.length > 0) {
      for(SummonerFavorite favorite in favorites){
        if(favorite.name == summonerFavorite.name){
          return true;
        }
      }
    }

    return false;
  }

  Future<List<SummonerFavorite>> findAllFavoriteSummoner() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query('summoner');
    final List<SummonerFavorite> summoners = List();
    for (Map<String, dynamic> row in result) {
      final SummonerFavorite summoner = SummonerFavorite(
        row['name'],
        row['encryptedId'],
      );
      summoners.add(summoner);
    }
    return summoners;
  }
}
