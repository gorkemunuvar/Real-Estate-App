import 'package:flutter/material.dart';

import 'section_title.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection(
    this.description, {
    super.key,
  });

  final String description;

  static const _space = 16.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Description'),
        const SizedBox(height: _space),
        Text(
          description,
          style: const TextStyle(fontSize: 14),
          maxLines: 15,
        ),
      ],
    );
  }
}
