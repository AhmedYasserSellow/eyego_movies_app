import 'package:eyego_movies_app/core/utils/app_constants.dart';
import 'package:eyego_movies_app/features/home/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required super.backdropPath,
    required super.id,
    required super.overview,
    required super.posterPath,
    required super.releaseDate,
    required super.title,
    required super.voteAverage,
    required super.genre,
  });

  factory MovieModel.fromTMDB(Map<String, dynamic> json) {
    String getGenreNameById(int id) {
      final genre = genres.firstWhere(
        (genre) => genre['id'] == id,
        orElse: () => {'name': 'Unknown'},
      );
      return genre['name'];
    }

    return MovieModel(
      genre: getGenreNameById(json["genre_ids"][0]),
      id: json["id"],

      posterPath: 'https://image.tmdb.org/t/p/original${json["poster_path"]}',

      overview: json["overview"],

      releaseDate: DateTime.parse(json["release_date"]).year.toString(),
      title: json["title"],

      voteAverage: double.parse(
        (json["vote_average"].toDouble()).toStringAsFixed(1),
      ),

      backdropPath:
          'https://image.tmdb.org/t/p/original${json["backdrop_path"]}',
    );
  }
}
