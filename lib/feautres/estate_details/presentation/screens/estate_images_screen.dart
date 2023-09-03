import 'package:flutter/material.dart';
import 'package:real_estate_app/core/logger/logger.dart';

import '../../../common/common.dart';

class EstateImagesScreen extends StatelessWidget {
  const EstateImagesScreen({
    required this.imageUrls,
    super.key,
  });

  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {h
    return BaseScreen(
      child: _View(imageUrls: imageUrls),
    );
  }
}

class _View extends StatefulWidget {
  const _View({
    required this.imageUrls,
  });

  final List<String> imageUrls;

  @override
  State<_View> createState() => _ViewState();
}

class _ViewState extends State<_View> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _ImagesPageView(
          imageUrls: widget.imageUrls,
          onPageChanged: _onPageChanged,
        ),
        const Align(
          alignment: Alignment.topRight,
          child: _ExitButton(),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: _CurrentPageIndicator(
            pageIndex: currentIndex,
            totalPageCount: widget.imageUrls.length,
          ),
        ),
      ],
    );
  }

  void _onPageChanged(int pageIndex) {
    setState(() => currentIndex = pageIndex);
  }
}

typedef OnPageChanged = void Function(int pageIndex);

class _ImagesPageView extends StatelessWidget {
  const _ImagesPageView({
    required this.imageUrls,
    required this.onPageChanged,
  });

  final List<String> imageUrls;
  final OnPageChanged onPageChanged;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      pageSnapping: true,
      onPageChanged: onPageChanged,
      itemCount: imageUrls.length,
      itemBuilder: (context, pageIndex) {
        return Image.network(imageUrls[pageIndex]);
      },
    );
  }
}

class _ExitButton extends StatelessWidget {
  const _ExitButton();

  static const _size = 32.0;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        AppLogger.wtf('Onpressed.');
        Navigator.of(context).pop();
      },
      icon: const Icon(Icons.close, size: _size, color: AppColors.greyX11),
    );
  }
}

class _CurrentPageIndicator extends StatelessWidget {
  const _CurrentPageIndicator({
    required this.pageIndex,
    required this.totalPageCount,
  });

  final int pageIndex;
  final int totalPageCount;

  static const _padding = EdgeInsets.symmetric(horizontal: 24, vertical: 16);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: Text(
        '${pageIndex + 1} / $totalPageCount',
        style: TextStyles.main,
      ),
    );
  }
}
