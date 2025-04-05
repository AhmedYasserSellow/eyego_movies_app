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

    default:
      return MaterialPageRoute(
        builder: (context) {
          return const Scaffold();
        },
      );
  }
}
