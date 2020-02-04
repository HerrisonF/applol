class LastPlayedGame {

  final String platformId;
  final String gameId;
  final String queue;
  final String champion;
  final String season;
  final String timestamp;
  final String role;
  final String lane;

  LastPlayedGame({
    this.platformId,
    this.gameId,
    this.queue,
    this.champion,
    this.season,
    this.timestamp,
    this.role,
    this.lane,
  });

  LastPlayedGame.fromJson(Map<String, dynamic> json)
      : platformId = json['platformId'].toString(),
        gameId = json['gameId'].toString(),
        queue = json['queue'].toString(),
        champion = json['champion'].toString(),
        season = json['season'].toString(),
        timestamp = json['timestamp'].toString(),
        role = json['role'].toString(),
        lane = json['lane'].toString();

  Map<String, dynamic> toJson() => {
        'platformId': platformId,
        'gameId': gameId,
        'queue': queue,
        'champion': champion,
        'season': season,
        'timestamp': timestamp,
        'role': role,
        'lane': lane
      };

  @override
  String toString() {
    return 'LastPlayedGame{platformId: $platformId, gameId: $gameId, queue: $queue, champion: $champion, season: $season, timestamp: $timestamp, role: $role, lane: $lane}';
  }


}
