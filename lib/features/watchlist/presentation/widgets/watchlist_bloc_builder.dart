import 'package:eyego_movies_app/core/widgets/list_view_builder.dart';
import 'package:eyego_movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:eyego_movies_app/features/watchlist/presentation/managers/watchlist/watchlist_cubit.dart';
import 'package:eyego_movies_app/features/watchlist/presentation/widgets/no_watch_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchlistBlocBuilder extends StatelessWidget {
  const WatchlistBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchlistCubit, WatchlistState>(
      builder: (context, state) {
        List<MovieEntity> movies = context.read<WatchlistCubit>().movies;
        if (movies.isEmpty) {
          return Center(child: const NoWatchList());
        } else {
          return CustomListViewBuilder(movies: movies);
        }
      },
    );
  }
}
