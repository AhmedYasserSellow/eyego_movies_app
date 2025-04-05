import 'package:eyego_movies_app/core/helper/on_generate_routes.dart';
import 'package:eyego_movies_app/core/utils/app_colors.dart';
import 'package:eyego_movies_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBGColor,
        primaryColor: AppColors.primaryColor,
      ),
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
