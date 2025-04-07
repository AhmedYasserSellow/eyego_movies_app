import 'package:eyego_movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:eyego_movies_app/features/home/presentation/widgets/movie_item.dart';
import 'package:flutter/material.dart';

class MoviesGridView extends StatelessWidget {
  const MoviesGridView({super.key, required this.movies});
  final List<MovieEntity> movies;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: getCrossAxisCount(MediaQuery.sizeOf(context).width),
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
        childAspectRatio: 2 / 3,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) => MovieItem(movie: movies[index]),
    );
  }

  int getCrossAxisCount(double screenWidth) {
    if (screenWidth < 320) {
      return 2;
    } else if (screenWidth < 480) {
      return 3;
    } else if (screenWidth < 600) {
      return 4;
    } else {
      return 5;
    }
  }
}
