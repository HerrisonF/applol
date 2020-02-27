class Gem {
  String id;
  String name;
  String toolTip;
  String shortDesc;
  String longDesc;
  String iconPath;

  Gem(
      {this.id,
      this.name,
      this.toolTip,
      this.shortDesc,
      this.longDesc,
      this.iconPath});

  Gem.fromJson(Map<String, dynamic> json)
      : id = json['id'].toString(),
        name = json['name'],
        toolTip = json['toolTip'],
        shortDesc = json['shortDesc'],
        longDesc = json['longDesc'],
        iconPath = json['iconPath'];

  @override
  String toString() {
    return 'Gem{id: $id, name: $name, toolTip: $toolTip, shortDesc: $shortDesc, longDesc: $longDesc, iconPath: $iconPath}';
  }

}
