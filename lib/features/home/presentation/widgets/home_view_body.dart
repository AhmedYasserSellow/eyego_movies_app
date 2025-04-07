import 'package:eyego_movies_app/core/utils/app_constants.dart';
import 'package:eyego_movies_app/features/home/presentation/widgets/movies_grid_view.dart';
import 'package:eyego_movies_app/features/home/presentation/widgets/movies_tab_bar.dart';
import 'package:eyego_movies_app/features/home/presentation/widgets/popular_movies_section.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: PopularMoviesSection()),
        SliverToBoxAdapter(child: const SizedBox(height: 20)),
        SliverToBoxAdapter(
          child: MoviesTabBar(
            currentIndex: currentIndex,
            onTap: (value) => setState(() => currentIndex = value),
          ),
        ),
        SliverToBoxAdapter(child: const SizedBox(height: 20)),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          sliver: MoviesGridView(),
        ),
      ],
    );
  }
}
