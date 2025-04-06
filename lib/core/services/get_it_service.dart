import 'package:eyego_movies_app/core/services/database_service.dart';
import 'package:eyego_movies_app/core/services/firebase_auth_service.dart';
import 'package:eyego_movies_app/core/services/firebase_firestore_service.dart';
import 'package:eyego_movies_app/features/auth/data/repos/sign_in_repo_impl.dart';
import 'package:eyego_movies_app/features/auth/data/repos/sign_up_repo_impl.dart';
import 'package:eyego_movies_app/features/auth/domain/repos/sign_in_repo.dart';
import 'package:eyego_movies_app/features/auth/domain/repos/sign_up_repo.dart';
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
}
