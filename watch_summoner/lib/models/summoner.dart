
class Summoner {
  final String id;
  final String accountId;
  final String puuid;
  final String name;
  final String iconId;
  final String revisionDate;
  final String level;

  Summoner(
    this.id,
    this.accountId,
    this.puuid,
    this.name,
    this.iconId,
    this.revisionDate,
    this.level,
  );

  Summoner.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        accountId = json['accountId'],
        puuid = json['puuid'],
        name = json['name'],
        iconId = json['profileIconId'].toString(),
        revisionDate = json['revisionDate'].toString(),
        level = json['summonerLevel'].toString();

  Map<String, dynamic> toJson() => {
        'id': id,
        'accountId': accountId,
        'puuid': puuid,
        'name': name,
        'profileIconId': iconId,
        'revisionDate': revisionDate,
        'summonerLevel': level,
      };

  @override
  String toString() {
    return 'Summoner{id: $id, accountId: $accountId, puuid: $puuid, name: $name, iconId: $iconId, revisionDate: $revisionDate, level: $level}';
  }
}
