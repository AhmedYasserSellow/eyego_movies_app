import 'package:eyego_movies_app/core/widgets/build_snack_bar.dart';
import 'package:eyego_movies_app/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:eyego_movies_app/features/auth/presentation/widgets/custom_modal_progress_hud.dart';
import 'package:eyego_movies_app/features/auth/presentation/widgets/sign_up/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpViewBlocConsumer extends StatelessWidget {
  const SignUpViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          buildSnackBar(context, 'account created successfully');
        }
        if (state is SignUpFailed) {
          buildSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomModalProgressHud(
          inAsyncCall: state is SignUpLoading,
          child: SignUpViewBody(),
        );
      },
    );
  }
}
