import 'package:json_annotation/json_annotation.dart';

part 'estate_details.g.dart';

@JsonSerializable()
class EstateDetailsModel {
  const EstateDetailsModel({
    required this.id,
    required this.address,
    required this.residentalArea,
    required this.parcelArea,
    required this.price,
    required this.description,
    // required this.listedSince,
    required this.latitude,
    required this.longitude,
  });

  factory EstateDetailsModel.fromJson(Map<String, dynamic> json) => _$EstateDetailsModelFromJson(json);

  @JsonKey(name: 'InternalId')
  final String id;

  @JsonKey(name: 'Adres')
  final String address;

  @JsonKey(name: 'WoonOppervlakte')
  final double residentalArea;

  @JsonKey(name: 'PerceelOppervlakte')
  final double parcelArea;

  @JsonKey(name: 'Koopprijs')
  final double price;

  @JsonKey(name: 'VolledigeOmschrijving')
  final String description;

  // @JsonKey(name: 'listedSince')
  // final String listedSince;

  @JsonKey(name: 'WGS84_X')
  final double latitude;

  @JsonKey(name: 'WGS84_Y')
  final double longitude;
}
