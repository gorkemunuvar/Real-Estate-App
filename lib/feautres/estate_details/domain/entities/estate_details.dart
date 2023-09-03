import 'package:equatable/equatable.dart';

import '../../data/models/models.dart';

class EstateDetails extends Equatable {
  const EstateDetails({
    required this.id,
    required this.address,
    required this.place,
    required this.postcode,
    required this.residentalArea,
    required this.parcelArea,
    required this.price,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.imageUrls,
  });

  final String id;
  final String address;
  final String place;
  final String postcode;
  final double residentalArea;
  final double parcelArea;
  final double price;
  final String description;
  final double latitude;
  final double longitude;
  final List<String> imageUrls;

  factory EstateDetails.fromModel(EstateDetailsModel model) {
    return EstateDetails(
      id: model.id,
      address: model.address,
      place: model.place,
      postcode: model.postcode,
      residentalArea: model.residentalArea,
      parcelArea: model.parcelArea,
      price: model.price,
      description: model.description,
      latitude: model.latitude,
      longitude: model.longitude,
      imageUrls: model.imageUrls,
    );
  }

  @override
  List<Object?> get props => [
        id,
        address,
        place,
        postcode,
        residentalArea,
        parcelArea,
        price,
        description,
        latitude,
        longitude,
        imageUrls,
      ];
}
