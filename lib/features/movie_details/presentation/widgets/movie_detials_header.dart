import 'package:cached_network_image/cached_network_image.dart';
import 'package:eyego_movies_app/core/utils/app_constants.dart';
import 'package:eyego_movies_app/core/utils/app_images.dart';
import 'package:eyego_movies_app/core/utils/app_text_styles.dart';
import 'package:eyego_movies_app/core/widgets/custom_list_tile.dart';
import 'package:eyego_movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';

class MovieDetailsHeader extends StatelessWidget {
  const MovieDetailsHeader({super.key, required this.movie});

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(kBorderRadius),
            bottomRight: Radius.circular(kBorderRadius),
          ),
          child: CachedNetworkImage(imageUrl: movie.backdropPath),
        ),
        Positioned(
          bottom: 12,
          right: 20,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Color(0xff252836),
              borderRadius: BorderRadius.circular(kBorderRadius),
            ),

            child: CustomListTile(
              icon: AppIcons.star,
              title: movie.voteAverage.toString(),
              color: Color(0xffFFC107),
            ),
          ),
        ),
        Positioned(
          left: 32,
          bottom: -60,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(kBorderRadius),
                child: CachedNetworkImage(
                  imageUrl: movie.posterPath,
                  width: 100,
                ),
              ),
              SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(movie.title, style: AppTextStyles.regularTextStyle),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
