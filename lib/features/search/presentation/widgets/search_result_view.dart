import 'package:eyego_movies_app/features/search/presentation/widgets/search_result_bloc_builder.dart';
import 'package:flutter/material.dart';

class SearchResultView extends StatelessWidget {
  const SearchResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchResultBlocBuilder();
  }
}
