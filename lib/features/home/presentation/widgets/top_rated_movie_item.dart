import 'package:eyego_movies_app/core/utils/app_colors.dart';
import 'package:eyego_movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:eyego_movies_app/features/home/presentation/widgets/movie_item.dart';
import 'package:flutter/material.dart';

class TopRatedMovieItem extends StatelessWidget {
  const TopRatedMovieItem({
    super.key,
    required this.index,
    required this.movie,
  });
  final String index;
  final MovieEntity movie;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomLeft,
      children: [
        MovieItem(
          movie: movie,
          height: MediaQuery.sizeOf(context).height * 0.26,
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
