import 'package:dartz/dartz.dart';
import 'package:eyego_movies_app/core/errors/failure.dart';
import 'package:eyego_movies_app/features/auth/domain/entities/user_entity.dart';
import 'package:eyego_movies_app/features/auth/domain/repos/sign_up_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpRepo) : super(SignUpInitial());
  final SignUpRepo signUpRepo;

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String name,
    required String password,
  }) async {
    emit(SignUpLoading());
    Either<Failure, UserEntity> result = await signUpRepo
        .signUpWithEmailAndPassword(
          name: name,
          email: email,
          password: password,
        );

    result.fold(
      (failure) => emit(SignUpFailed(message: failure.message)),
      (user) => emit(SignUpSuccess(userEntity: user)),
    );
  }
}
