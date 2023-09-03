import 'package:flutter/material.dart';

import '../../estate_details.dart';
import 'section_title.dart';

class MainDetailsSection extends StatelessWidget {
  const MainDetailsSection({
    required this.estateDetails,
    super.key,
  });

  final EstateDetails estateDetails;

  static const _space = 16.0;

  @override
  Widget build(BuildContext context) {
    final addressDetails = '${estateDetails.postcode} ${estateDetails.place}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          title: estateDetails.address,
        ),
        const SizedBox(height: _space),
        Text(
          addressDetails,
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(height: _space),
        _OtherDetails(
          residentalArea: estateDetails.residentalArea,
          parcelArea: estateDetails.parcelArea,
        ),
        const SizedBox(height: _space),
        Text(
          estateDetails.price.toString(),
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}

class _OtherDetails extends StatelessWidget {
  const _OtherDetails({
    required this.residentalArea,
    required this.parcelArea,
  });

  final double residentalArea;
  final double parcelArea;

  static const _space = 8.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          residentalArea.toString(),
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(width: _space),
        Text(
          parcelArea.toString(),
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
