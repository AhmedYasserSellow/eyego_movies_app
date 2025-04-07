import 'package:eyego_movies_app/core/services/firebase_auth_service.dart';
import 'package:eyego_movies_app/core/services/get_it_service.dart';
import 'package:eyego_movies_app/core/utils/app_images.dart';
import 'package:eyego_movies_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:eyego_movies_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const String routeName = 'splash_view';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    executeNavigation(context);
    super.initState();
  }

  executeNavigation(BuildContext context) {
    bool isUserSignedIn = getIt<FirebaseAuthService>().isUserSignedIn();

    Future.delayed(const Duration(seconds: 2), () {
      if (context.mounted) {
        if (isUserSignedIn) {
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        } else {
          Navigator.pushReplacementNamed(context, SignInView.routeName);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset(AppImages.logo)));
  }
}
