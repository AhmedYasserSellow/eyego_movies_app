part of 'sign_up_cubit.dart';

abstract class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {
  final UserEntity userEntity;

  SignUpSuccess({required this.userEntity});
}

final class SignUpFailed extends SignUpState {
  final String message;

  SignUpFailed({required this.message});
}
