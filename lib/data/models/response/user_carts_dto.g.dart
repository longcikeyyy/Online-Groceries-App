// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_carts_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCartsDto _$UserCartsDtoFromJson(Map<String, dynamic> json) => UserCartsDto(
  carts: (json['carts'] as List<dynamic>)
      .map((e) => CartDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num).toInt(),
  skip: (json['skip'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
);

Map<String, dynamic> _$UserCartsDtoToJson(UserCartsDto instance) =>
    <String, dynamic>{
      'carts': instance.carts,
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
    };
