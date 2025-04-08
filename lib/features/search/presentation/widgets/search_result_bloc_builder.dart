import 'package:eyego_movies_app/core/widgets/custom_loading_indicator.dart';
import 'package:eyego_movies_app/core/widgets/error_widget.dart';
import 'package:eyego_movies_app/core/widgets/list_view_builder.dart';
import 'package:eyego_movies_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:eyego_movies_app/features/search/presentation/widgets/no_search_found.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultBlocBuilder extends StatelessWidget {
  const SearchResultBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          if (state.movies.isEmpty) {
            return NoSearchFound();
          } else {
            return CustomListViewBuilder(movies: state.movies);
          }
        } else if (state is SearchError) {
          return CustomErrorWidget(errMessage: state.message);
        } else if (state is SearchLoading) {
          return const Center(child: CustomLoadingIndicator());
        } else {
          return SizedBox();
        }
      },
    );
  }
}
