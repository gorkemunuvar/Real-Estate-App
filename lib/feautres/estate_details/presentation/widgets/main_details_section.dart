import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../common/common.dart';
import '../../estate_details.dart';

class MainDetailsSection extends StatelessWidget {
  const MainDetailsSection({
    required this.estateDetails,
    super.key,
  });

  final EstateDetails estateDetails;

  static const _space = 6.0;

  @override
  Widget build(BuildContext context) {
    return Section(
      title: estateDetails.address,
      titleTextStyle: TextStyles.sectionTitle.copyWith(fontSize: 22),
      spaceBetween: _space,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${estateDetails.postcode} ${estateDetails.place}',
            style: TextStyles.mainGrey,
          ),
          const SizedBox(height: _space),
          _SquareDetails(
            residentalArea: estateDetails.residentalArea,
            parcelArea: estateDetails.parcelArea,
          ),
          const SizedBox(height: _space * 2),
          Text(
            '€${formatPrice(estateDetails.price)}',
            style: TextStyles.sectionTitle,
          ),
        ],
      ),
    );
  }

  ///Splits the numbers by commas(,)
  String formatPrice(double price) {
    final formatter = NumberFormat('#,##,###,000');
    return formatter.format(price);
  }
}

class _SquareDetails extends StatelessWidget {
  const _SquareDetails({
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
        const Icon(
          Icons.crop_square,
          color: AppColors.iconGrey,
        ),
        const SizedBox(width: 4.0),
        Text(
          '${residentalArea.toInt().toString()} m\u00b2',
          style: TextStyles.main,
        ),
        const SizedBox(width: _space),
        const Icon(
          Icons.home_outlined,
          color: AppColors.iconGrey,
        ),
        const SizedBox(width: 4.0),
        Text(
          '${parcelArea.toInt().toString()} m\u00b2',
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
