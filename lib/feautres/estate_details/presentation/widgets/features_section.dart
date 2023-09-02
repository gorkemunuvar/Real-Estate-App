import 'package:flutter/material.dart';

import 'section_title.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  static const _space = 10.0;

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: 'Features'),
        SizedBox(height: _space),
        Text(
          'Lorem ipsum dolor.',
          style: TextStyle(fontSize: 14),
          maxLines: 15,
        ),
      ],
    );
  }
}
