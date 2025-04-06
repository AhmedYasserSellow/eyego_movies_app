import 'package:eyego_movies_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static const appNameTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );
  static const regularTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textColor,
  );

  static const textFieldTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Color(0xff67686D),
  );
}
