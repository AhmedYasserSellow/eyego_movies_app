import 'package:cached_network_image/cached_network_image.dart';
import 'package:eyego_movies_app/core/utils/app_constants.dart';
import 'package:eyego_movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, this.height, required this.movie});
  final double? height;
  final MovieEntity movie;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(kBorderRadius),
        child: CachedNetworkImage(
          imageUrl: movie.posterPath,

          fit: BoxFit.cover,
          height: height,
        ),
      ),
    );
  }
}
