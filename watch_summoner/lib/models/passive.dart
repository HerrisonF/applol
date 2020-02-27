import 'package:json_annotation/json_annotation.dart';

part 'passive.g.dart';

@JsonSerializable()
class Passive{

  String name;
  String description;

  Passive(this.name, this.description);
  factory Passive.fromJson(Map<String, dynamic> json) => _$PassiveFromJson(json);
  Map<String, dynamic> toJson() => _$PassiveToJson(this);
}