import 'package:eyego_movies_app/core/utils/app_colors.dart';
import 'package:eyego_movies_app/core/utils/app_text_styles.dart';
import 'package:eyego_movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:eyego_movies_app/features/movie_details/presentation/widgets/bookmark_item.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.movie});

  final MovieEntity movie;
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
      title: Text('Details', style: AppTextStyles.appBarTextStyle),
      actions: [BookMarkItem(movie: movie)],
    );
  }
}
