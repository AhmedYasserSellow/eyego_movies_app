import 'package:eyego_movies_app/core/utils/app_constants.dart';
import 'package:eyego_movies_app/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:eyego_movies_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:eyego_movies_app/features/auth/presentation/widgets/column_text_field.dart';
import 'package:eyego_movies_app/features/auth/presentation/widgets/logo_presenter.dart';
import 'package:eyego_movies_app/features/auth/presentation/widgets/sign_up/already_have_an_account.dart';
import 'package:eyego_movies_app/features/auth/presentation/widgets/toogle_obscure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  bool obscureText = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, email, password;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              spacing: 20,
              children: [
                LogoPresenter(title: 'Create an account'),
                ColumnTextField(
                  title: 'Name',
                  onChanged: (String value) {
                    setState(() {
                      name = value;
                    });
                  },
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
                ColumnTextField(
                  title: 'Email',
                  onChanged: (String value) {
                    setState(() {
                      email = value;
                    });
                  },
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Email is required';
                    }
                    if (!value.contains('@')) {
                      return 'Email is not valid';
                    }
                    return null;
                  },
                ),
                ColumnTextField(
                  title: 'Password',
                  obscureText: obscureText,
                  suffixIcon: ToogleObscure(
                    obscureText: obscureText,
                    onToggle: (value) => setState(() => obscureText = value),
                  ),
                  onChanged: (String value) {
                    setState(() {
                      password = value;
                    });
                  },
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 8) {
                      return 'Password is weak';
                    }
                    return null;
                  },
                ),
                AuthButton(
                  title: 'Sign Up',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      await context
                          .read<SignUpCubit>()
                          .signUpWithEmailAndPassword(
                            email: email,
                            name: name,
                            password: password,
                          );
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                ),
                const AlreadyHaveAnAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
