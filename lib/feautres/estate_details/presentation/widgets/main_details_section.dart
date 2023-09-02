import 'package:flutter/material.dart';

import 'section_title.dart';

class MainDetailsSection extends StatelessWidget {
  const MainDetailsSection({super.key});

  static const _space = 16.0;

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: 'Address Title'),
        SizedBox(height: _space),
        Text('Address Details', style: TextStyle(fontSize: 14)),
        SizedBox(height: _space),
        Text('Other Details', style: TextStyle(fontSize: 14)),
        SizedBox(height: _space),
        Text('Price', style: TextStyle(fontSize: 14)),
      ],
    );
  }
}
