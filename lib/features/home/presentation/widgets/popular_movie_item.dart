import 'package:eyego_movies_app/core/utils/app_colors.dart';
import 'package:eyego_movies_app/core/utils/app_constants.dart';
import 'package:eyego_movies_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class PopularMovieItem extends StatelessWidget {
  const PopularMovieItem({super.key, required this.index});
  final String index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(kBorderRadius),
          child: Image.asset(
            AppImages.moviePoster,
            fit: BoxFit.cover,
            height: MediaQuery.sizeOf(context).height * 0.26,
          ),
        ),
        Positioned(
          left: -20,
          bottom: -52,
          child: Text(
            index,
            style: TextStyle(
              fontSize: 96,
              foreground:
                  Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2
                    ..color = AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
