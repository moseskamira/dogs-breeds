// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed_images_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedImagesResponse _$BreedImagesResponseFromJson(Map<String, dynamic> json) =>
    BreedImagesResponse(
      (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BreedImagesResponseToJson(
        BreedImagesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
