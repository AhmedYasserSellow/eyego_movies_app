import 'package:eyego_movies_app/core/utils/app_colors.dart';
import 'package:eyego_movies_app/core/utils/app_text_styles.dart';
import 'package:eyego_movies_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?  ',
          style: AppTextStyles.regularTextStyle,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, SignInView.routeName);
          },
          child: Text(
            'Sign In',
            style: AppTextStyles.regularTextStyle.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
