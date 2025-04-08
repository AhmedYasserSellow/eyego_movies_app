import 'package:eyego_movies_app/core/utils/app_constants.dart';
import 'package:eyego_movies_app/core/utils/app_text_styles.dart';
import 'package:eyego_movies_app/features/watchlist/presentation/widgets/watchlist_bloc_builder.dart';
import 'package:flutter/material.dart';

class WatchListView extends StatelessWidget {
  const WatchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 12),
        Text('Watchlist', style: AppTextStyles.appBarTextStyle),
        SizedBox(height: 24),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: WatchlistBlocBuilder(),
          ),
        ),
      ],
    );
  }
}
