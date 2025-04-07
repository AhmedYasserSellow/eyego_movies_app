import 'package:eyego_movies_app/core/widgets/custom_loading_indicator.dart';
import 'package:eyego_movies_app/core/widgets/error_widget.dart';
import 'package:eyego_movies_app/features/home/presentation/managers/popluar_cubit/popular_cubit.dart';
import 'package:eyego_movies_app/features/home/presentation/widgets/movies_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularMoviesBlocBuilder extends StatelessWidget {
  const PopularMoviesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularCubit, PopularState>(
      builder: (context, state) {
        if (state is PopularSuccess) {
          return MoviesGridView(movies: state.movies);
        } else if (state is PopularError) {
          return CustomErrorWidget(errMessage: state.message);
        } else {
          return Center(child: CustomLoadingIndicator());
        }
      },
    );
  }
}
