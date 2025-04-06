import 'package:dartz/dartz.dart';
import 'package:eyego_movies_app/core/errors/failure.dart';
import 'package:eyego_movies_app/features/auth/domain/entities/user_entity.dart';
import 'package:eyego_movies_app/features/auth/domain/repos/sign_in_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.signInRepo) : super(SignInInitial());
  final SignInRepo signInRepo;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SignInLoading());
    Either<Failure, UserEntity> result = await signInRepo
        .signInWithEmailAndPassword(email: email, password: password);
    result.fold(
      (failure) => emit(SignInFailed(message: failure.message)),
      (user) => emit(SignInSuccess(userEntity: user)),
    );
  }
}
