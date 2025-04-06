import 'package:eyego_movies_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:eyego_movies_app/features/auth/presentation/widgets/column_text_field.dart';
import 'package:eyego_movies_app/features/auth/presentation/widgets/logo_presenter.dart';
import 'package:eyego_movies_app/features/auth/presentation/widgets/sign_up/already_have_an_account.dart';
import 'package:flutter/material.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          spacing: 20,
          children: [
            LogoPresenter(title: 'Create an account'),
            ColumnTextField(title: 'Email', onChanged: (String value) {}),
            ColumnTextField(
              title: 'Password',
              obscureText: true,
              onChanged: (String value) {},
            ),
            AuthButton(onTap: () {}),
            const AlreadyHaveAnAccount(),
          ],
        ),
      ),
    );
  }
}
