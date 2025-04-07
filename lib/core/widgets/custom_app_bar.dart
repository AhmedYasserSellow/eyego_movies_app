import 'package:eyego_movies_app/core/utils/app_colors.dart';
import 'package:eyego_movies_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: AppColors.textColor),
        onPressed: () => Navigator.pop(context),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      title: Text(title, style: AppTextStyles.appBarTextStyle),
      actions: [Icon(Icons.bookmark_outline, color: AppColors.textColor)],
    );
    // return Padding(
    //   padding: const EdgeInsets.only(top: 12),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Text(title, style: AppTextStyles.appBarTextStyle),
    //      ,
    //     ],
    //   ),
    // );
  }
}
