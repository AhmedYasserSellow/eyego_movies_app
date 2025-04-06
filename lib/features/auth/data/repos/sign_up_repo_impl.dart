import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:eyego_movies_app/core/errors/exceptions.dart';
import 'package:eyego_movies_app/core/errors/failure.dart';
import 'package:eyego_movies_app/core/services/database_service.dart';
import 'package:eyego_movies_app/core/services/firebase_auth_service.dart';
import 'package:eyego_movies_app/features/auth/data/models/user_model.dart';
import 'package:eyego_movies_app/features/auth/domain/entities/user_entity.dart';
import 'package:eyego_movies_app/features/auth/domain/repos/sign_up_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepoImpl implements SignUpRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;
  const SignUpRepoImpl({
    required this.firebaseAuthService,
    required this.databaseService,
  });

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  Future<void> addUserData({required UserEntity userEntity}) async {
    await databaseService.addData(
      path: 'users',
      data: userEntity.toMap(),
      docID: userEntity.uID,
    );
  }

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await user.updateDisplayName(name);
      await user.reload();
      user = FirebaseAuth.instance.currentUser;
      UserEntity userEntity = UserModel.fromFirebaseUser(user!);
      await addUserData(userEntity: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      log('Error AuthRepoImpl.createUserWithEmailAndPassword: ${e.message}');
      return Left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log('Error AuthRepoImpl.createUserWithEmailAndPassword: $e');
      return Left(ServerFailure(e.toString()));
    }
  }
}
