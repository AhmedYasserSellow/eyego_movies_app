import 'package:eyego_movies_app/core/utils/app_constants.dart';
import 'package:eyego_movies_app/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:eyego_movies_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:eyego_movies_app/features/auth/presentation/widgets/column_text_field.dart';
import 'package:eyego_movies_app/features/auth/presentation/widgets/logo_presenter.dart';
import 'package:eyego_movies_app/features/auth/presentation/widgets/sign_in/do_not_have_an_account.dart';
import 'package:eyego_movies_app/features/auth/presentation/widgets/toogle_obscure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  late String email;
  late String password;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LogoPresenter(title: 'Welcome Back'),
              ColumnTextField(
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Email is required';
                  }

                  return null;
                },
                title: 'Email',
                onChanged: (String value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              ColumnTextField(
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Password is required';
                  }

                  return null;
                },
                title: 'Password',
                obscureText: obscureText,
                suffixIcon: ToogleObscure(
                  obscureText: obscureText,
                  onToggle: (bool value) {
                    setState(() {
                      obscureText = value;
                    });
                  },
                ),
                onChanged: (String value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              AuthButton(
                title: 'Sign In',
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    await context
                        .read<SignInCubit>()
                        .signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const DoNotHaveAnAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
