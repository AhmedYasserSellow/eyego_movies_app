import 'package:eyego_movies_app/core/utils/app_constants.dart';
import 'package:eyego_movies_app/features/auth/presentation/widgets/sign_in_view_body.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const routeName = 'sign_in';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: SignInViewBody(),
      ),
    );
  }
}
