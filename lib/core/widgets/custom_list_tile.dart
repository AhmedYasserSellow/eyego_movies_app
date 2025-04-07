import 'package:eyego_movies_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.icon,
    required this.title,
    this.color = Colors.white,
  });
  final String icon;
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(icon, color: color, height: 24, width: 24),
        SizedBox(width: 8),
        Text(
          title,
          style: AppTextStyles.regularTextStyle.copyWith(color: color),
        ),
      ],
    );
  }
}
