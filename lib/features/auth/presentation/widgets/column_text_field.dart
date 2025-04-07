import 'package:eyego_movies_app/core/utils/app_text_styles.dart';
import 'package:eyego_movies_app/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ColumnTextField extends StatelessWidget {
  const ColumnTextField({
    super.key,
    required this.title,
    required this.onChanged,
    this.suffixIcon,
    this.obscureText = false,
    required this.validator,
  });
  final String title;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.regularTextStyle),
        const SizedBox(height: 12),
        CustomTextFormField(
          onChanged: onChanged,
          hintText: title,
          suffixIcon: suffixIcon,
          obscureText: obscureText,
          validator: validator,
        ),
      ],
    );
  }
}
