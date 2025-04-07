import 'package:eyego_movies_app/core/services/get_it_service.dart';
import 'package:eyego_movies_app/features/search/domain/repos/search_repo.dart';
import 'package:eyego_movies_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:eyego_movies_app/features/search/presentation/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt<SearchRepo>()),
      child: const Scaffold(body: SafeArea(child: SearchViewBody())),
    );
  }
}
