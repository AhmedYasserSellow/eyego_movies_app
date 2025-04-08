import 'package:eyego_movies_app/core/utils/app_colors.dart';
import 'package:eyego_movies_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:eyego_movies_app/features/search/presentation/widgets/filter_dialog.dart';
import 'package:eyego_movies_app/features/search/presentation/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatefulSearchTextField extends StatefulWidget {
  const StatefulSearchTextField({super.key});

  @override
  State<StatefulSearchTextField> createState() =>
      _StatefulSearchTextFieldState();
}

class _StatefulSearchTextFieldState extends State<StatefulSearchTextField> {
  String? selectedGenre;
  @override
  Widget build(BuildContext context) {
    return SearchTextField(
      hintText: 'Search',
      onSumbitted: (value) {
        context.read<SearchCubit>().getSearchFiltredMovies(
          query: value,
          genre: selectedGenre,
        );
      },
      suffixIcon: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return FilterDialog(
                genre: selectedGenre,
                onChange: (value) {
                  selectedGenre = value;
                },
              );
            },
          );
        },
        child: Icon(Icons.filter_list, color: AppColors.greyTextColor),
      ),
    );
  }
}
