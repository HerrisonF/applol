class Item {
  String id;
  String name;
  String description;
  String gold;
  String plaintext;

  Item({this.id, this.description, this.gold, this.plaintext, this.name});

  Item.fromJson(Map<String, dynamic> json, index)
      : id = index,
        name = json['name'],
        description = json['description'],
        gold = json['gold']['base'].toString(),
        plaintext = json['plaintext'];



  @override
  String toString() {
    return 'Item{id: $id, description: $description, gold: $gold, plaintext: $plaintext}';
  }


}