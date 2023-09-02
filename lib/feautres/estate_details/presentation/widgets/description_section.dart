import 'package:flutter/material.dart';

import 'section_title.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({super.key});

  static const _space = 16.0;

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: 'Description'),
        SizedBox(height: _space),
        Text(
          _mockDescription,
          style: TextStyle(fontSize: 14),
          maxLines: 15,
        ),
      ],
    );
  }
}

const _mockDescription =
    'Lorep Ipsum. Lorep Ipsum. Lorep Ipsum. Lorep Ipsum. Lorep Ipsum. Lorep Ipsum. Lorep Ipsum. Lorep Ipsum. Lorep Ipsum. Lorep Ipsum. Lorep Ipsum. Lorep Ipsum. Lorep Ipsum. Lorep Ipsum. Lorep Ipsum. Lorep Ipsum. Lorep Ipsum. Lorep Ipsum. Lorep Ipsum. Lorep Ipsum. Lorep Ipsum. Lorep Ipsum. Lorep Ipsum. Lorep Ipsum. Lorep Ipsum. Lorep Ipsum. Lorep Ipsum. Lorep Ipsum. Lorep Ipsum. Lorep Ipsum. Lorep Ipsum. Lorep Ipsum. Lorep Ipsum. Lorep Ipsum. ';
