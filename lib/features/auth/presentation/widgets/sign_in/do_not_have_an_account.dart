import 'package:eyego_movies_app/core/utils/app_colors.dart';
import 'package:eyego_movies_app/core/utils/app_text_styles.dart';
import 'package:eyego_movies_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:flutter/material.dart';

class DoNotHaveAnAccount extends StatelessWidget {
  const DoNotHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account?  ',
          style: AppTextStyles.regularTextStyle,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, SignUpView.routeName);
          },
          child: Text(
            'Sign Up',
            style: AppTextStyles.regularTextStyle.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
