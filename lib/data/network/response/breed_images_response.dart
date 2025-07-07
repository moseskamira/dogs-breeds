import 'package:dogs/data/models/breeds_response_message.dart';
import 'package:json_annotation/json_annotation.dart';

part 'breed_images_response.g.dart';

@JsonSerializable()
class BreedImagesResponse {
  List<String>? message;

  BreedImagesResponse(
    this.message,
  );

  factory BreedImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$BreedImagesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BreedImagesResponseToJson(this);
}
