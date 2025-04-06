import 'package:eyego_movies_app/core/utils/app_colors.dart';
import 'package:eyego_movies_app/core/utils/app_text_styles.dart';
import 'package:eyego_movies_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:eyego_movies_app/features/auth/presentation/widgets/column_text_field.dart';
import 'package:flutter/material.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Welcome to\nEyeGo Movies App',
            textAlign: TextAlign.center,
            style: AppTextStyles.appNameTextStyle,
          ),
          const SizedBox(height: 20),
          ColumnTextField(title: 'Email', onChanged: (String value) {}),
          const SizedBox(height: 20),
          ColumnTextField(title: 'Password', onChanged: (String value) {}),
          const SizedBox(height: 20),
          AuthButton(onTap: () {}),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Don\'t have an account?  ',
                style: AppTextStyles.regularTextStyle,
              ),
              Text(
                'Sign Up',
                style: AppTextStyles.regularTextStyle.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
