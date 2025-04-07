import 'package:eyego_movies_app/core/utils/app_images.dart';
import 'package:eyego_movies_app/core/utils/app_text_styles.dart';
import 'package:eyego_movies_app/core/widgets/custom_loading_indicator.dart';
import 'package:eyego_movies_app/core/widgets/error_widget.dart';
import 'package:eyego_movies_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:eyego_movies_app/features/search/presentation/widgets/search_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultBlocBuilder extends StatelessWidget {
  const SearchResultBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return ListView.separated(
            itemCount: state.movies.length,
            separatorBuilder: (context, index) {
              return SizedBox(height: 24);
            },
            itemBuilder: (context, index) {
              if (state.movies.isEmpty) {
                return Column(
                  children: [
                    Image.asset(AppImages.noSearchFound),
                    SizedBox(height: 16),
                    Text(
                      'We are Sorry, We Can Not Find The Movie :(',
                      style: AppTextStyles.regularTextStyle,
                    ),
                  ],
                );
              } else {
                return SearchItem(movie: state.movies[index]);
              }
            },
          );
        } else if (state is SearchError) {
          return CustomErrorWidget(errMessage: state.message);
        } else {
          return Center(child: CustomLoadingIndicator());
        }
      },
    );
  }
}
