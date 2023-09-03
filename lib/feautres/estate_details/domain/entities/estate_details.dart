import 'package:equatable/equatable.dart';

import '../../data/models/models.dart';

class EstateDetails extends Equatable {
  const EstateDetails({
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

  final String id;
  final String address;
  final double residentalArea;
  final double parcelArea;
  final double price;
  final String description;
  // final String listedSince;
  final double latitude;
  final double longitude;
  final List<String> imageUrls;

  factory EstateDetails.fromModel(EstateDetailsModel model) {
    return EstateDetails(
      id: model.id,
      address: model.address,
      residentalArea: model.residentalArea,
      parcelArea: model.parcelArea,
      price: model.price,
      description: model.description,
      // listedSince: model.listedSince,
      latitude: model.latitude,
      longitude: model.longitude,
      imageUrls: model.imageUrls,
    );
  }

  @override
  List<Object?> get props => [
        id,
        address,
        residentalArea,
        parcelArea,
        price,
        description,
        // listedSince,
        latitude,
        longitude,
        imageUrls,
      ];
}
