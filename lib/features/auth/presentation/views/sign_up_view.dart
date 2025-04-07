import 'package:eyego_movies_app/core/services/get_it_service.dart';
import 'package:eyego_movies_app/features/auth/domain/repos/sign_up_repo.dart';
import 'package:eyego_movies_app/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:eyego_movies_app/features/auth/presentation/widgets/sign_up/sign_up_view_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = 'sign_up';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(getIt<SignUpRepo>()),
      child: const Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(child: SignUpViewBlocConsumer()),
      ),
    );
  }
}
