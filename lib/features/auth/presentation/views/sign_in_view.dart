import 'package:eyego_movies_app/core/services/get_it_service.dart';
import 'package:eyego_movies_app/features/auth/domain/repos/sign_in_repo.dart';
import 'package:eyego_movies_app/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:eyego_movies_app/features/auth/presentation/widgets/sign_in/sign_in_view_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const routeName = 'sign_in';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt<SignInRepo>()),
      child: const Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(child: SignInViewBlocConsumer()),
      ),
    );
  }
}
