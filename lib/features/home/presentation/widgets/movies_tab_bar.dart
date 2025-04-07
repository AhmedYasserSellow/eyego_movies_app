import 'package:eyego_movies_app/features/home/presentation/widgets/movie_tab.dart';
import 'package:flutter/material.dart';

class MoviesTabBar extends StatelessWidget {
  const MoviesTabBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  final int currentIndex;
  final void Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MovieTab(title: 'Now Playing', isSelected: currentIndex == 0),
        MovieTab(title: 'Upcoming', isSelected: currentIndex == 1),
        MovieTab(title: 'Top Rated', isSelected: currentIndex == 2),
      ],
    );
  }
}
