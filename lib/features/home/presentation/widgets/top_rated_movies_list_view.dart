import 'package:eyego_movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:eyego_movies_app/features/home/presentation/widgets/top_rated_movie_item.dart';
import 'package:flutter/material.dart';

class TopRatedMoviesListView extends StatelessWidget {
  const TopRatedMoviesListView({super.key, required this.movies});
  final List<MovieEntity> movies;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(width: 32),
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return Center(
          child: Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 24 : 0,
              right: index == movies.length - 1 ? 24 : 0,
            ),
            child: TopRatedMovieItem(
              index: (index + 1).toString(),
              movie: movies[index],
            ),
          ),
        );
      },
    );
  }
}
