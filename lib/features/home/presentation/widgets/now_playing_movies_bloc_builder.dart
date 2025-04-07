import 'package:eyego_movies_app/core/widgets/custom_loading_indicator.dart';
import 'package:eyego_movies_app/features/home/presentation/managers/now_playing/now_playing_cubit.dart';
import 'package:eyego_movies_app/features/home/presentation/widgets/movies_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NowPlayingMoviesBlocBuilder extends StatelessWidget {
  const NowPlayingMoviesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingCubit, NowPlayingState>(
      builder: (context, state) {
        if (state is NowPlayingSuccess) {
          return MoviesGridView(movies: state.movies);
        } else if (state is NowPlayingError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: CustomLoadingIndicator());
        }
      },
    );
  }
}
