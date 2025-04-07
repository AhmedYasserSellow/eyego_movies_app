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
  static const List<String> movieTabsList = [
    'Now Playing',
    'Upcoming',
    'Popular',
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(movieTabsList.length, (index) {
        return GestureDetector(
          onTap: () {
            onTap(index);
          },
          child: MovieTab(
            title: movieTabsList[index],
            isSelected: currentIndex == index,
          ),
        );
      }),
    );
  }
}
