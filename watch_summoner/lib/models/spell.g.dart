// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Spell _$SpellFromJson(Map<String, dynamic> json) {
  return Spell(
    json['id'] as String,
    json['name'] as String,
    json['description'] as String,
    json['tooltip'] as String,
  )..keyType = _$enumDecodeNullable(_$KeyTypeEnumMap, json['keyType']);
}

Map<String, dynamic> _$SpellToJson(Spell instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'tooltip': instance.tooltip,
      'keyType': _$KeyTypeEnumMap[instance.keyType],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$KeyTypeEnumMap = {
  KeyType.q: 'q',
  KeyType.w: 'w',
  KeyType.e: 'e',
  KeyType.r: 'r',
};
