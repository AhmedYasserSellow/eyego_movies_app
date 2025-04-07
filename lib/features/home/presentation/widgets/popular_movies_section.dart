import 'package:eyego_movies_app/features/home/presentation/widgets/popular_movie_item.dart';
import 'package:flutter/material.dart';

class PopularMoviesSection extends StatelessWidget {
  const PopularMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.3 + 24,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 32),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Center(
            child: Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 24 : 0,
                right: index == 4 ? 24 : 0,
              ),
              child: PopularMovieItem(index: (index + 1).toString()),
            ),
          );
        },
      ),
    );
  }
}
