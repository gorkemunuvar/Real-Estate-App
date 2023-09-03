import 'package:flutter/material.dart';
import 'package:real_estate_app/feautres/estate_details/estate_details.dart';

import '../../../common/common.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection(
    this.description, {
    super.key,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Description',
      child: Text(
        maxLines: 13,
        description,
        overflow: TextOverflow.fade,
        style: TextStyles.description,
      ),
    );
  }
}
