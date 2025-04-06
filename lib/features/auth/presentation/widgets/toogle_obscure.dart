import 'package:eyego_movies_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ToogleObscure extends StatelessWidget {
  const ToogleObscure({
    super.key,
    required this.obscureText,
    required this.onToggle,
  });
  final bool obscureText;
  final ValueChanged<bool> onToggle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        obscureText ? Icons.visibility : Icons.visibility_off,
        color: AppColors.greyTextColor,
      ),
      onTap: () => onToggle(!obscureText),
    );
  }
}
