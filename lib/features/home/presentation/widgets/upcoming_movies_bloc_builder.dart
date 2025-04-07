import 'package:eyego_movies_app/core/widgets/custom_loading_indicator.dart';
import 'package:eyego_movies_app/features/home/presentation/managers/upcoming/upcoming_cubit.dart';
import 'package:eyego_movies_app/features/home/presentation/widgets/movies_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingMoviesBlocBuilder extends StatelessWidget {
  const UpcomingMoviesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingCubit, UpcomingState>(
      builder: (context, state) {
        if (state is UpcomingSuccess) {
          return MoviesGridView(movies: state.movies);
        } else if (state is UpComingError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: CustomLoadingIndicator());
        }
      },
    );
  }
}
