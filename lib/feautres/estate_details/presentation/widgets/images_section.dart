import 'package:flutter/material.dart';

import '../../estate_details.dart';

class ImagesSection extends StatelessWidget {
  const ImagesSection(
    this.imageUrls, {
    super.key,
  });

  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context),
      child: Image.network(imageUrls.first),
    );
  }

  void _onTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => EstateImagesScreen(imageUrls: imageUrls),
      ),
    );
  }
}
