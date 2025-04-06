part of 'sign_in_cubit.dart';

abstract class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInFailed extends SignInState {
  final String message;
  SignInFailed({required this.message});
}

final class SignInSuccess extends SignInState {
  final UserEntity userEntity;
  SignInSuccess({required this.userEntity});
}
