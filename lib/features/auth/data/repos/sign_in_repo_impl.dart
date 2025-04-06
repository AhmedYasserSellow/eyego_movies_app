import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:eyego_movies_app/core/errors/exceptions.dart';
import 'package:eyego_movies_app/core/errors/failure.dart';
import 'package:eyego_movies_app/core/services/firebase_auth_service.dart';
import 'package:eyego_movies_app/features/auth/data/models/user_model.dart';
import 'package:eyego_movies_app/features/auth/domain/entities/user_entity.dart';
import 'package:eyego_movies_app/features/auth/domain/repos/sign_in_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInRepoImpl implements SignInRepo {
  final FirebaseAuthService firebaseAuthService;
  const SignInRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      User user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      log('Error AuthRepoImpl.signInWithEmailAndPassword: ${e.message}');
      return Left(ServerFailure(e.message));
    }
  }
}
