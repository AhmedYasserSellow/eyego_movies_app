import 'package:eyego_movies_app/core/utils/app_colors.dart';
import 'package:eyego_movies_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomButtonNavBar extends StatelessWidget {
  const CustomButtonNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final void Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.primaryColor)),
      ),
      child: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        backgroundColor: AppColors.scaffoldBGColor,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.greyTextColor,
        selectedLabelStyle: AppTextStyles.selsctedNavbarLabelTextStyle,
        unselectedLabelStyle: AppTextStyles.unSelectedNavBarLabelTextStyle,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),

          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline),
            label: 'Watchlist',
          ),
        ],
      ),
    );
  }
}
