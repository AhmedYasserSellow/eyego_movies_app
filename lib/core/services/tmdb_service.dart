import 'package:dio/dio.dart';
import 'package:eyego_movies_app/core/services/movie_api_service.dart';
import 'package:eyego_movies_app/features/home/data/models/movie_model.dart';

class TMDB implements MovieApiService {
  final String baseUrl = 'https://api.themoviedb.org/3';
  final String movieEndPoint = 'movie';
  final String searcByNamehEndPoint = 'search/movie';
  final String searchByCategoryEndPoint = 'discover/movie';
  Dio dio = Dio();

  @override
  Future<List<MovieModel>> getPopular({required String apiKey}) async {
    Response response = await dio.get(
      '$baseUrl/$movieEndPoint/popular?api_key=$apiKey',
    );
    return List.generate(
      response.data['results'].length,
      (index) => MovieModel.fromTMDB(response.data['results'][index]),
    );
  }

  @override
  Future<List<MovieModel>> getTopRated({required String apiKey}) async {
    Response response = await dio.get(
      '$baseUrl/$movieEndPoint/top_rated?api_key=$apiKey',
    );
    return List.generate(
      10,
      (index) => MovieModel.fromTMDB(response.data['results'][index]),
    );
  }

  @override
  Future<List<MovieModel>> getUpcoming({required String apiKey}) async {
    Response response = await dio.get(
      '$baseUrl/$movieEndPoint/upcoming?api_key=$apiKey',
    );
    return List.generate(
      response.data['results'].length,
      (index) => MovieModel.fromTMDB(response.data['results'][index]),
    );
  }

  @override
  Future<List<MovieModel>> getSearchMovieByCategory({
    required String apiKey,
    required int query,
  }) async {
    Response response = await dio.get(
      '$baseUrl/$searchByCategoryEndPoint?api_key=$apiKey&with_genres=$query',
    );
    return List.generate(
      response.data['results'].length,
      (index) => MovieModel.fromTMDB(response.data['results'][index]),
    );
  }

  @override
  Future<List<MovieModel>> getSearchMovieByName({
    required String apiKey,
    required String query,
  }) async {
    Response response = await dio.get(
      '$baseUrl/$searcByNamehEndPoint?api_key=$apiKey&query=$query',
    );
    return List.generate(
      response.data['results'].length,
      (index) => MovieModel.fromTMDB(response.data['results'][index]),
    );
  }

  @override
  Future<List<MovieModel>> getNowPlaying({required String apiKey}) async {
    Response response = await dio.get(
      '$baseUrl/$movieEndPoint/now_playing?api_key=$apiKey',
    );
    return List.generate(
      response.data['results'].length,
      (index) => MovieModel.fromTMDB(response.data['results'][index]),
    );
  }

  @override
  Future<MovieModel> getMovieDetials({
    required String apiKey,
    required int movieID,
  }) async {
    Response response = await dio.get(
      '$baseUrl/$movieEndPoint/$movieID?api_key=$apiKey',
    );
    return MovieModel.fromTMDB(response.data);
  }
}
