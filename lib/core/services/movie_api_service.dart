import 'package:eyego_movies_app/features/home/data/models/movie_model.dart';

abstract class MovieApiService {
  Future<List<MovieModel>> getPopular({required String apiKey});
  Future<List<MovieModel>> getUpcoming({required String apiKey});
  Future<List<MovieModel>> getTopRated({required String apiKey});
  Future<List<MovieModel>> getNowPlaying({required String apiKey});
  Future<MovieModel> getMovieDetials({
    required String apiKey,
    required int movieID,
  });
  Future<List<MovieModel>> getSearchMovieByName({
    required String apiKey,
    required String query,
  });
  Future<List<MovieModel>> getSearchMovieByCategory({
    required String apiKey,
    required int query,
  });
}
