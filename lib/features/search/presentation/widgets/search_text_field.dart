import 'package:eyego_movies_app/core/utils/app_colors.dart';
import 'package:eyego_movies_app/core/utils/app_constants.dart';
import 'package:eyego_movies_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.hintText,
    required this.onSumbitted,
    this.suffixIcon,
  });
  final String hintText;
  final void Function(String)? onSumbitted;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextStyles.regularTextStyle,
      cursorColor: AppColors.textColor,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        hintStyle: AppTextStyles.textFieldTextStyle,
        fillColor: Color(0xff3A3F47),
        filled: true,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        hintText: hintText,
      ),
      onSubmitted: onSumbitted,
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(kBorderRadius),
    );
  }
}
