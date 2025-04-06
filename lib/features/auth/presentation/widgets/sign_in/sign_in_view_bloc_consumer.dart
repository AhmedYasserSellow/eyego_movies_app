import 'package:eyego_movies_app/core/widgets/build_snack_bar.dart';
import 'package:eyego_movies_app/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:eyego_movies_app/features/auth/presentation/widgets/custom_modal_progress_hud.dart';
import 'package:eyego_movies_app/features/auth/presentation/widgets/sign_in/sign_in_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInViewBlocConsumer extends StatelessWidget {
  const SignInViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          //TODO : Navigate to home feature
        }
        if (state is SignInFailed) {
          buildSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomModalProgressHud(
          inAsyncCall: state is SignInLoading,
          child: SignInViewBody(),
        );
      },
    );
  }
}
