import 'package:eyego_movies_app/core/utils/app_images.dart';
import 'package:eyego_movies_app/core/utils/app_text_styles.dart';
import 'package:eyego_movies_app/core/widgets/custom_list_tile.dart';
import 'package:eyego_movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:eyego_movies_app/features/home/presentation/widgets/movie_item.dart';
import 'package:eyego_movies_app/features/movie_details/presentation/views/movie_details_view.dart';
import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key, required this.movie});
  final MovieEntity movie;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          MovieDetailsView.routeName,
          arguments: movie,
        );
      },
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            MovieItem(movie: movie),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Text(
                      movie.title,
                      style: AppTextStyles.regularTextStyle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    children: [
                      CustomListTile(
                        icon: AppIcons.star,
                        title: movie.voteAverage.toString(),
                        color: Color(0xffFF8700),
                      ),
                      CustomListTile(icon: AppIcons.ticket, title: movie.genre),
                      CustomListTile(
                        icon: AppIcons.calendar,
                        title: movie.releaseDate,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
