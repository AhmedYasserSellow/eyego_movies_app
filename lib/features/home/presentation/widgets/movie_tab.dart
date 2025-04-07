import 'package:eyego_movies_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class MovieTab extends StatelessWidget {
  const MovieTab({super.key, required this.title, required this.isSelected});
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          Text(
            title,
            style:
                isSelected
                    ? AppTextStyles.selectedTabTextStyle
                    : AppTextStyles.unSelectedTabTextStyle,
          ),
          SizedBox(height: 4),
          Container(
            height: 4,
            width: 52,
            color: isSelected ? Color(0xff3A3F47) : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
