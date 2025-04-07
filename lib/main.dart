import 'package:device_preview/device_preview.dart';
import 'package:eyego_movies_app/core/helper/on_generate_routes.dart';
import 'package:eyego_movies_app/core/services/bloc_observer.dart';
import 'package:eyego_movies_app/core/services/get_it_service.dart';
import 'package:eyego_movies_app/core/utils/app_colors.dart';
import 'package:eyego_movies_app/features/splash/presentation/views/splash_view.dart';
import 'package:eyego_movies_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  getItSetup();
  runApp(
    DevicePreview(
      enabled: kIsWeb,
      builder: (context) {
        return const MyApp();
      },
    ),
  );
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

      // Device Preview
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
    );
  }
}
