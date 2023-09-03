// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estate_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EstateDetailsModel _$EstateDetailsModelFromJson(Map<String, dynamic> json) =>
    EstateDetailsModel(
      id: json['InternalId'] as String,
      address: json['Adres'] as String,
      residentalArea: (json['WoonOppervlakte'] as num).toDouble(),
      parcelArea: (json['PerceelOppervlakte'] as num).toDouble(),
      price: (json['Koopprijs'] as num).toDouble(),
      description: json['VolledigeOmschrijving'] as String,
      latitude: (json['WGS84_X'] as num).toDouble(),
      longitude: (json['WGS84_Y'] as num).toDouble(),
      imageUrls: const _NestedMediaConverter().fromJson(json['Media'] as List),
    );
