// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breeds_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedsResponse _$BreedsResponseFromJson(Map<String, dynamic> json) =>
    BreedsResponse(
      json['message'] == null
          ? null
          : BreedsResponseMessage.fromJson(
              json['message'] as Map<String, dynamic>),
      json['status'] as String?,
    );

Map<String, dynamic> _$BreedsResponseToJson(BreedsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
