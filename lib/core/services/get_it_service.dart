import 'package:eyego_movies_app/core/services/database_service.dart';
import 'package:eyego_movies_app/core/services/firebase_auth_service.dart';
import 'package:eyego_movies_app/core/services/firebase_firestore_service.dart';
import 'package:eyego_movies_app/core/services/movie_api_service.dart';
import 'package:eyego_movies_app/core/services/tmdb_service.dart';
import 'package:eyego_movies_app/features/auth/data/repos/sign_in_repo_impl.dart';
import 'package:eyego_movies_app/features/auth/data/repos/sign_up_repo_impl.dart';
import 'package:eyego_movies_app/features/auth/domain/repos/sign_in_repo.dart';
import 'package:eyego_movies_app/features/auth/domain/repos/sign_up_repo.dart';
import 'package:eyego_movies_app/features/home/data/repos/home_repo_impl.dart';
import 'package:eyego_movies_app/features/home/domain/repos/home_repo.dart';
import 'package:eyego_movies_app/features/search/data/repos/search_repo_impl.dart';
import 'package:eyego_movies_app/features/search/domain/repos/search_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void getItSetup() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FirebaseFirestoreService());
  getIt.registerSingleton<SignInRepo>(
    SignInRepoImpl(firebaseAuthService: getIt<FirebaseAuthService>()),
  );
  getIt.registerSingleton<SignUpRepo>(
    SignUpRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
  getIt.registerSingleton<MovieApiService>(TMDB());
  getIt.registerSingleton<HomeRepo>(
    HomeRepoImpl(movieApiService: getIt<MovieApiService>()),
  );
  getIt.registerSingleton<SearchRepo>(
    SearchRepoImpl(movieApiService: getIt<MovieApiService>()),
  );
}
