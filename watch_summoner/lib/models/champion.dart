class Champion {
  final String id;
  final String level;
  final String points;
  final String lastPlayTime;
  final String pointsSinceLastLevel;
  final String pointsUntilNextLevel;
  final String chestGranted;
  final String tokensEarned;
  final String summonerId;

  Champion(
    this.id,
    this.level,
    this.points,
    this.lastPlayTime,
    this.pointsSinceLastLevel,
    this.pointsUntilNextLevel,
    this.chestGranted,
    this.tokensEarned,
    this.summonerId,
  );

  Champion.fromJson(Map<String, dynamic> json)
      : id = json['championId'].toString(),
        level = json['championLevel'].toString(),
        points = json['championPoints'].toString(),
        lastPlayTime = json['lastPlayTime'].toString(),
        pointsSinceLastLevel = json['championPointsSinceLastLevel'].toString(),
        pointsUntilNextLevel = json['championPointsUntilNextLevel'].toString(),
        chestGranted = json['chestGranted'].toString(),
        tokensEarned = json['tokensEarned'].toString(),
        summonerId = json['summonerId'];

  Map<String, dynamic> toJson() => {
        'championId': id,
        'championLevel': level,
        'championPoints': points,
        'lastPlayTime': lastPlayTime,
        'championPointsSinceLastLevel': pointsSinceLastLevel,
        'championPointsUntilNextLevel': pointsUntilNextLevel,
        'chestGranted': chestGranted,
        'tokensEarned': tokensEarned,
        'summonerId': summonerId,
      };

  @override
  String toString() {
    return 'Champion{id: $id, level: $level, points: $points, lastPlayTime: $lastPlayTime, pointsSinceLastLevel: $pointsSinceLastLevel, pointsUntilNextLevel: $pointsUntilNextLevel, chestGranted: $chestGranted, tokensEarned: $tokensEarned, summonerId: $summonerId}';
  }
}
