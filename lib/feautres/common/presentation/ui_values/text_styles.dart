import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class TextStyles {
  static const main = TextStyle(
    fontSize: 16,
  );

  static const sectionTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const description = TextStyle(
    fontSize: 15,
    color: AppColors.descriptionGrey,
  );

  static final mainGrey = main.copyWith(
    color: AppColors.greyX11,
  );
}
