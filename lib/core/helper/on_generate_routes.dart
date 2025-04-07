import 'package:eyego_movies_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:eyego_movies_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:eyego_movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:eyego_movies_app/features/home/presentation/views/home_view.dart';
import 'package:eyego_movies_app/features/movie_details/presentation/views/movie_details_view.dart';
import 'package:eyego_movies_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

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
          return const HomeView();
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
