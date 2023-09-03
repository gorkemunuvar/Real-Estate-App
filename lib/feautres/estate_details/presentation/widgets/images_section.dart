import 'package:flutter/material.dart';

class ImagesSection extends StatelessWidget {
  const ImagesSection(
    this.url, {
    super.key,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Image.network(url);
  }
}
