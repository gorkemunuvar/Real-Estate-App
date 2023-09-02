import 'package:flutter/material.dart';

const mockImagePath = 'http://cloud.funda.nl/valentina_media/179/406/791_groot.jpg';

class ImagesSection extends StatelessWidget {
  const ImagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(mockImagePath);
  }
}
