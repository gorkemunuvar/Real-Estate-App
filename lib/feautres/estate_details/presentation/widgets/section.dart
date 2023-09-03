import 'package:flutter/material.dart';

import '../../../common/common.dart';

class Section extends StatelessWidget {
  const Section({
    required this.title,
    required this.child,
    this.titleTextStyle = TextStyles.sectionTitle,
    this.spaceBetween = 16,
    super.key,
  });

  final String title;
  final Widget child;
  final TextStyle titleTextStyle;
  final double spaceBetween;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: titleTextStyle),
        SizedBox(height: spaceBetween),
        child,
      ],
    );
  }
}
