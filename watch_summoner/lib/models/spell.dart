import 'package:json_annotation/json_annotation.dart';

part 'spell.g.dart';

@JsonSerializable()
class Spell{
  String id;
  String name;
  String description;
  String tooltip;
  KeyType keyType;

  Spell(this.id, this.name, this.description, this.tooltip);

  factory Spell.fromJson(Map<String, dynamic> json) => _$SpellFromJson(json);

  Map<String, dynamic> toJson() => _$SpellToJson(this);

}

enum KeyType{
  q,
  w,
  e,
  r,
}