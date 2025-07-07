import 'package:dogs/data/models/breeds_response_message.dart';
import 'package:json_annotation/json_annotation.dart';

part 'breeds_response.g.dart';

@JsonSerializable()
class BreedsResponse {
  BreedsResponseMessage? message;
  String? status;

  BreedsResponse(
    this.message,
    this.status,
  );

  factory BreedsResponse.fromJson(Map<String, dynamic> json) =>
      _$BreedsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BreedsResponseToJson(this);
}
