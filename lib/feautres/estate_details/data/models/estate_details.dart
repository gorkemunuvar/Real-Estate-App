import 'package:json_annotation/json_annotation.dart';

part 'estate_details.g.dart';

@JsonSerializable(createToJson: false)
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
    required this.imageUrls,
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

  // TODO: Add if needed.
  // @JsonKey(name: 'listedSince')
  // final String listedSince;

  @JsonKey(name: 'WGS84_X')
  final double latitude;

  @JsonKey(name: 'WGS84_Y')
  final double longitude;

  @_NestedMediaConverter()
  @JsonKey(name: 'Media')
  final List<String> imageUrls;
}

class _NestedMediaConverter implements JsonConverter<List<dynamic>, List<String>> {
  const _NestedMediaConverter();

  @override
  List<String> fromJson(List<dynamic> medias) {
    return medias.map((media) {
      final mediaItems = media['MediaItems'] as List;
      final mediaItem = mediaItems.length >= 3 ? mediaItems[2] : mediaItems[0];
      final imageUrl = mediaItem['Url'].toString();

      return imageUrl;
    }).toList();
  }

  @override
  List<String> toJson(List<dynamic> object) {
    return object.map((e) => e.toString()).toList();
  }
}
