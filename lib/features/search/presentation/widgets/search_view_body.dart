import 'package:eyego_movies_app/core/utils/app_colors.dart';
import 'package:eyego_movies_app/core/utils/app_constants.dart';
import 'package:eyego_movies_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:eyego_movies_app/features/search/presentation/widgets/search_result_bloc_builder.dart';
import 'package:eyego_movies_app/features/search/presentation/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          SizedBox(height: 24),
          SearchTextField(
            hintText: 'Search',
            onSumbitted: (value) {
              context.read<SearchCubit>().getSearchFiltredMovies(
                query: value,
                genre: null,
              );
            },
            suffixIcon: Icon(Icons.filter_list, color: AppColors.greyTextColor),
          ),
          SizedBox(height: 24),
          Expanded(child: SearchResultBlocBuilder()),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
