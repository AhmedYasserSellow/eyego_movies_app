import 'package:eyego_movies_app/core/widgets/custom_loading_indicator.dart';
import 'package:eyego_movies_app/features/home/presentation/managers/top_rated/top_rated_cubit.dart';
import 'package:eyego_movies_app/features/home/presentation/widgets/top_rated_movies_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopRatedMoviesListViewBlocBuilder extends StatelessWidget {
  const TopRatedMoviesListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.3 + 24,
      child: BlocBuilder<TopRatedCubit, TopRatedState>(
        builder: (context, state) {
          if (state is TopRatedSuccess) {
            return TopRatedMoviesListView(movies: state.movies);
          } else if (state is TopRatedError) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: CustomLoadingIndicator());
          }
        },
      ),
    );
  }
}
