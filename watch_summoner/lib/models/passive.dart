import 'package:json_annotation/json_annotation.dart';

import 'image.dart';

part 'passive.g.dart';

@JsonSerializable()
class Passive{

  String name;
  String description;
  Image image;

  Passive(this.name, this.description, this.image);

  factory Passive.fromJson(Map<String, dynamic> json) => _$PassiveFromJson(json);

  Map<String, dynamic> toJson(Passive instance) => <String, dynamic>{
    'name': instance.name,
    'description' : instance.description,
    'image' : instance.image,
  };

}