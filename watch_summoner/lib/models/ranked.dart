class Ranked {
  final String leagueId;
  final String queueType;
  final String tier;
  final String rank;
  final String summonerId;
  final String summonerName;
  final String leaguePoints;
  final String wins;
  final String losses;
  final String veteran;
  final String inactive;
  final String freshBlood;
  final String hotStreak;

  Ranked({
    this.leagueId,
    this.queueType,
    this.tier,
    this.rank,
    this.summonerId,
    this.summonerName,
    this.leaguePoints,
    this.wins,
    this.losses,
    this.veteran,
    this.inactive,
    this.freshBlood,
    this.hotStreak,
  });

  Ranked.fromJson(Map<String, dynamic> json)
      : leagueId = json['leagueId'].toString(),
        queueType = json['queueType'].toString(),
        tier = json['tier'].toString().toLowerCase(),
        rank = json['rank'].toString(),
        summonerId = json['summonerId'].toString(),
        summonerName = json['summonerName'].toString(),
        leaguePoints = json['leaguePoints'].toString(),
        wins = json['wins'].toString(),
        losses = json['losses'].toString(),
        veteran = json['veteran'].toString(),
        inactive = json['inactive'].toString(),
        freshBlood = json['freshBlood'].toString(),
        hotStreak = json['hotStreak'].toString();

  Map<String, dynamic> toJson() => {
        'leagueId': leagueId,
        'queueType': queueType,
        'tier': tier,
        'rank': rank,
        'summonerId': summonerId,
        'summonerName': summonerName,
        'leaguePoints': leaguePoints,
        'wins': wins,
        'losses': losses,
        'veteran': veteran,
        'inactive': inactive,
        'freshBlood': freshBlood,
        'hotStreak': hotStreak,
      };

  @override
  String toString() {
    return 'Ranked{leagueId: $leagueId, queueType: $queueType, tier: $tier, rank: $rank, summonerId: $summonerId, summonerName: $summonerName, leaguePoints: $leaguePoints, wins: $wins, losses: $losses, veteran: $veteran, inactive: $inactive, freshBlood: $freshBlood, hotStreak: $hotStreak}';
  }
}
