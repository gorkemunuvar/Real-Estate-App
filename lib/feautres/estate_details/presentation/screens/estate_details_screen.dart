import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class EstateDetailsScreen extends StatelessWidget {
  const EstateDetailsScreen({super.key});

  static const _space = 32.0;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImagesSection(),
            SizedBox(height: _space),
            MainDetailsSection(),
            SizedBox(height: _space),
            DescriptionSection(),
            SizedBox(height: _space),
            FeaturesSection(),
            SizedBox(height: _space),
            LocationSection(),
            SizedBox(height: _space),
          ],
        ),
      ),
    );
  }
}
