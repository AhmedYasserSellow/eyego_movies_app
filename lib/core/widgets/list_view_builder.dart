import 'package:eyego_movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:eyego_movies_app/features/search/presentation/widgets/search_item.dart';
import 'package:flutter/material.dart';

class CustomListViewBuilder extends StatelessWidget {
  const CustomListViewBuilder({super.key, required this.movies});
  final List<MovieEntity> movies;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: movies.length,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 24);
      },
      itemBuilder: (context, index) {
        return SearchItem(movie: movies[index]);
      },
    );
  }
}
