import 'package:eyego_movies_app/core/utils/app_constants.dart';
import 'package:eyego_movies_app/features/search/presentation/widgets/search_result_bloc_builder.dart';
import 'package:eyego_movies_app/features/search/presentation/widgets/stateful_search_field.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          SizedBox(height: 24),
          StatefulSearchTextField(),
          SizedBox(height: 24),
          Expanded(child: SearchResultBlocBuilder()),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
