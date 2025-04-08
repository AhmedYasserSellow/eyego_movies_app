import 'package:eyego_movies_app/core/services/get_it_service.dart';
import 'package:eyego_movies_app/core/utils/app_colors.dart';
import 'package:eyego_movies_app/features/home/domain/entities/movie_entity.dart';
import 'package:eyego_movies_app/features/watchlist/domain/repos/watchlist_repo.dart';
import 'package:eyego_movies_app/features/watchlist/presentation/managers/watchlist/watchlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookMarkItem extends StatefulWidget {
  const BookMarkItem({super.key, required this.movie});
  final MovieEntity movie;
  @override
  State<BookMarkItem> createState() => _BookMarkItemState();
}

class _BookMarkItemState extends State<BookMarkItem> {
  late bool isBookamrked;
  @override
  void initState() {
    super.initState();
    List<MovieEntity> movies = context.read<WatchlistCubit>().movies;
    isBookamrked = movies.any((movie) => movie.id == widget.movie.id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (isBookamrked) {
          getIt<WatchlistRepo>().removeFromWatchlist(
            movieID: widget.movie.id.toString(),
          );
        } else {
          getIt<WatchlistRepo>().addToWatchlist(movieEntity: widget.movie);
        }
        await context.read<WatchlistCubit>().getWatchlistMovies();
        setState(() {
          isBookamrked = !isBookamrked;
        });
      },
      child: Icon(
        isBookamrked ? Icons.bookmark : Icons.bookmark_outline,
        color: AppColors.textColor,
      ),
    );
  }
}
