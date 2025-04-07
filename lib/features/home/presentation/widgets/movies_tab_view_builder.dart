import 'package:eyego_movies_app/features/home/presentation/widgets/now_playing_movies_bloc_builder.dart';
import 'package:eyego_movies_app/features/home/presentation/widgets/popular_movies_bloc_builder.dart';
import 'package:eyego_movies_app/features/home/presentation/widgets/upcoming_movies_bloc_builder.dart';
import 'package:flutter/material.dart';

class MoviesTabViewBuilder extends StatelessWidget {
  const MoviesTabViewBuilder({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    if (currentIndex == 0) {
      return NowPlayingMoviesBlocBuilder();
    } else if (currentIndex == 1) {
      return UpcomingMoviesBlocBuilder();
    } else {
      return PopularMoviesBlocBuilder();
    }
  }
}
