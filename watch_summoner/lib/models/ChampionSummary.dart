class ChampionSummary {
  String id;
  String name;
  String alias;
  List<dynamic> roles;
  String pathIcon;

  ChampionSummary({this.id, this.name, this.alias});

  ChampionSummary.fromJson(Map<String, dynamic> json):
      id = json['id'].toString(),
      name = json['name'],
      alias = json['alias'],
      roles = json['roles'];

  @override
  String toString() {
    return 'ChampionSummary{id: $id, name: $name, alias: $alias, roles: $roles}';
  }

}