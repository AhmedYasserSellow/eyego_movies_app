import 'package:eyego_movies_app/core/services/get_it_service.dart';
import 'package:eyego_movies_app/features/home/domain/repos/home_repo.dart';
import 'package:eyego_movies_app/features/home/presentation/managers/now_playing/now_playing_cubit.dart';
import 'package:eyego_movies_app/features/home/presentation/managers/popluar_cubit/popular_cubit.dart';
import 'package:eyego_movies_app/features/home/presentation/managers/upcoming/upcoming_cubit.dart';
import 'package:eyego_movies_app/features/home/presentation/widgets/now_playing_movies_bloc_builder.dart';
import 'package:eyego_movies_app/features/home/presentation/widgets/popular_movies_bloc_builder.dart';
import 'package:eyego_movies_app/features/home/presentation/widgets/upcoming_movies_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesTabViewBuilder extends StatelessWidget {
  const MoviesTabViewBuilder({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    if (currentIndex == 0) {
      return BlocProvider(
        create:
            (context) =>
                NowPlayingCubit(getIt<HomeRepo>())..getNowPlayingMovies(),
        child: NowPlayingMoviesBlocBuilder(),
      );
    } else if (currentIndex == 1) {
      return BlocProvider(
        create:
            (context) => UpcomingCubit(getIt<HomeRepo>())..getUpcomingMovies(),

        child: UpcomingMoviesBlocBuilder(),
      );
    } else {
      return BlocProvider(
        create:
            (context) => PopularCubit(getIt<HomeRepo>())..getPopularMovies(),

        child: PopularMoviesBlocBuilder(),
      );
    }
  }
}
