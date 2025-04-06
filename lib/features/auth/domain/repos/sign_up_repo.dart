import 'package:dartz/dartz.dart';
import 'package:eyego_movies_app/core/errors/failure.dart';
import 'package:eyego_movies_app/features/auth/domain/entities/user_entity.dart';

abstract class SignUpRepo {
  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });
}
