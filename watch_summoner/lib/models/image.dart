import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Image {
  String full;
  String sprite;
  String group;

  Image(this.full, this.sprite, this.group);

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson(Image instance) => <String, dynamic>{
    'full': instance.full,
    'sprite': instance.sprite,
    'group': instance.group,
  };
}