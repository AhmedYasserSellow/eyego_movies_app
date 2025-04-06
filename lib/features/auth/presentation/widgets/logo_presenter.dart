import 'package:eyego_movies_app/core/utils/app_images.dart';
import 'package:eyego_movies_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class LogoPresenter extends StatelessWidget {
  const LogoPresenter({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppImages.logo),
        Row(children: [Text(title, style: AppTextStyles.appNameTextStyle)]),
      ],
    );
  }
}
