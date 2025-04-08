import 'package:eyego_movies_app/core/utils/app_images.dart';
import 'package:eyego_movies_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class NoWatchList extends StatelessWidget {
  const NoWatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppImages.noWatchlist),
        const SizedBox(height: 16),
        Text(
          'Your Watchlist Is Empty :(',
          style: AppTextStyles.regularTextStyle,
        ),
      ],
    );
  }
}
