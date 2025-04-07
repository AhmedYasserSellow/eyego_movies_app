import 'package:eyego_movies_app/core/services/get_it_service.dart';
import 'package:eyego_movies_app/core/utils/app_constants.dart';
import 'package:eyego_movies_app/features/home/domain/repos/home_repo.dart';
import 'package:eyego_movies_app/features/home/presentation/managers/top_rated/top_rated_cubit.dart';
import 'package:eyego_movies_app/features/home/presentation/widgets/movies_tab_bar.dart';
import 'package:eyego_movies_app/features/home/presentation/widgets/movies_tab_view_builder.dart';
import 'package:eyego_movies_app/features/home/presentation/widgets/top_rated_movie_list_view_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: BlocProvider(
            create:
                (context) =>
                    TopRatedCubit(getIt<HomeRepo>())..getTopRatedMovies(),
            child: TopRatedMoviesListViewBlocBuilder(),
          ),
        ),
        SliverToBoxAdapter(child: const SizedBox(height: 20)),
        SliverToBoxAdapter(
          child: MoviesTabBar(
            currentIndex: currentIndex,
            onTap: (value) => setState(() => currentIndex = value),
          ),
        ),
        SliverToBoxAdapter(child: const SizedBox(height: 20)),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          sliver: SliverToBoxAdapter(
            child: MoviesTabViewBuilder(currentIndex: currentIndex),
          ),
        ),
        SliverToBoxAdapter(child: const SizedBox(height: 20)),
      ],
    );
  }
}
