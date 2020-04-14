class SummonerFavorite {
  int id;
  String name;
  String encryptedId;

  SummonerFavorite(this.name, this.encryptedId);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'encryptedId': encryptedId,
    };
  }
}
