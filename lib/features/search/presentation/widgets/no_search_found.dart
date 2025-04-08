import 'package:eyego_movies_app/core/utils/app_images.dart';
import 'package:eyego_movies_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class NoSearchFound extends StatelessWidget {
  const NoSearchFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppImages.noSearchFound),
        SizedBox(height: 16),
        Text(
          'We are Sorry, We Can Not Find The Movie :(',
          style: AppTextStyles.regularTextStyle,
        ),
      ],
    );
  }
}
