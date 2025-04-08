import 'package:eyego_movies_app/core/utils/app_colors.dart';
import 'package:eyego_movies_app/core/utils/app_constants.dart';
import 'package:eyego_movies_app/core/utils/app_images.dart';
import 'package:eyego_movies_app/core/utils/app_text_styles.dart';
import 'package:eyego_movies_app/features/movie_details/presentation/widgets/custom_app_bar.dart';
import 'package:eyego_movies_app/core/widgets/custom_list_tile.dart';
import 'package:eyego_movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:eyego_movies_app/features/movie_details/presentation/widgets/movie_detials_header.dart';
import 'package:flutter/material.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key, required this.movie});
  static const String routeName = 'movie_details';
  final MovieEntity movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kHorizontalPadding,
              ),
              child: CustomAppBar(movie: movie),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MovieDetailsHeader(movie: movie),
                    SizedBox(height: 76),
                    Row(
                      children: [
                        Spacer(),
                        CustomListTile(
                          icon: AppIcons.calendar,
                          title: movie.releaseDate,
                          color: AppColors.greyTextColor2,
                        ),
                        SizedBox(width: 24),
                        CustomListTile(
                          icon: AppIcons.ticket,
                          title: movie.genre,
                          color: AppColors.greyTextColor2,
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 32),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: kHorizontalPadding,
                      ),
                      child: Text(
                        movie.overview,
                        style: AppTextStyles.regularTextStyle.copyWith(
                          fontSize: 24,
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
