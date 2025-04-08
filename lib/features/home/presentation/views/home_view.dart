import 'package:eyego_movies_app/features/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:eyego_movies_app/features/home/presentation/widgets/home_view_body.dart';
import 'package:eyego_movies_app/features/search/presentation/views/search_view.dart';
import 'package:eyego_movies_app/features/watchlist/presentation/managers/watchlist/watchlist_cubit.dart';
import 'package:eyego_movies_app/features/watchlist/presentation/views/watch_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const routeName = 'home_view';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  final List<Widget> homePagesList = const [
    HomeViewBody(),
    SearchView(),
    WatchListView(),
  ];
  @override
  void initState() {
    context.read<WatchlistCubit>().getWatchlistMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: homePagesList[currentIndex]),
      bottomNavigationBar: CustomButtonNavBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}
