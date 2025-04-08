import 'package:eyego_movies_app/core/services/get_it_service.dart';
import 'package:eyego_movies_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:eyego_movies_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:eyego_movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:eyego_movies_app/features/home/domain/repos/home_repo.dart';
import 'package:eyego_movies_app/features/home/presentation/managers/now_playing/now_playing_cubit.dart';
import 'package:eyego_movies_app/features/home/presentation/managers/popluar_cubit/popular_cubit.dart';
import 'package:eyego_movies_app/features/home/presentation/managers/top_rated/top_rated_cubit.dart';
import 'package:eyego_movies_app/features/home/presentation/managers/upcoming/upcoming_cubit.dart';
import 'package:eyego_movies_app/features/home/presentation/views/home_view.dart';
import 'package:eyego_movies_app/features/movie_details/presentation/views/movie_details_view.dart';
import 'package:eyego_movies_app/features/splash/presentation/views/splash_view.dart';
import 'package:eyego_movies_app/features/watchlist/domain/repos/watchlist_repo.dart';
import 'package:eyego_movies_app/features/watchlist/presentation/managers/watchlist/watchlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(
        builder: (context) {
          return const SplashView();
        },
      );

    case SignInView.routeName:
      return MaterialPageRoute(
        builder: (context) {
          return const SignInView();
        },
      );

    case SignUpView.routeName:
      return MaterialPageRoute(
        builder: (context) {
          return const SignUpView();
        },
      );

    case HomeView.routeName:
      return MaterialPageRoute(
        builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create:
                    (context) =>
                        TopRatedCubit(getIt<HomeRepo>())..getTopRatedMovies(),
              ),
              BlocProvider(
                create:
                    (context) =>
                        NowPlayingCubit(getIt<HomeRepo>())
                          ..getNowPlayingMovies(),
              ),
              BlocProvider(
                create:
                    (context) =>
                        UpcomingCubit(getIt<HomeRepo>())..getUpcomingMovies(),
              ),
              BlocProvider(
                create:
                    (context) =>
                        PopularCubit(getIt<HomeRepo>())..getPopularMovies(),
              ),
              BlocProvider(
                create:
                    (context) =>
                        WatchlistCubit(getIt<WatchlistRepo>())
                          ..getWatchlistMovies,
              ),
            ],
            child: const HomeView(),
          );
        },
      );
    case MovieDetailsView.routeName:
      MovieEntity movieEntity = routeSettings.arguments as MovieEntity;
      return MaterialPageRoute(
        builder: (context) {
          return MovieDetailsView(movie: movieEntity);
        },
      );
    default:
      return MaterialPageRoute(
        builder: (context) {
          return const Scaffold();
        },
      );
  }
}
