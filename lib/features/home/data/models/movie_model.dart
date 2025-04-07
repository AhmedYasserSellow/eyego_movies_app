import 'package:eyego_movies_app/features/home/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final bool adult;
  final List<int> genreIds;
  final String originalLanguage;
  final String originalTitle;
  final double popularity;
  final bool video;
  final int voteCount;

  const MovieModel({
    required this.adult,
    required this.genreIds,
    required this.originalLanguage,
    required this.originalTitle,
    required this.popularity,
    required this.video,
    required this.voteCount,
    required super.backdropPath,
    required super.id,
    required super.overview,
    required super.posterPath,
    required super.releaseDate,
    required super.title,
    required super.voteAverage,
    required super.genre,
  });

  factory MovieModel.fromTMDB(Map<String, dynamic> json) => MovieModel(
    adult: json["adult"],
    backdropPath: 'https://image.tmdb.org/t/p/original${json["backdrop_path"]}',
    genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    genre: json['genre_ids'][0].toString(),
    id: json["id"],
    originalLanguage: json["original_language"],
    posterPath: 'https://image.tmdb.org/t/p/original${json["poster_path"]}',
    originalTitle: json["original_title"],
    overview: json["overview"],
    popularity: json["popularity"].toDouble(),
    releaseDate: DateTime.parse(json["release_date"]).year.toString(),
    title: json["title"],
    video: json["video"],
    voteAverage: json["vote_average"].toDouble(),
    voteCount: json["vote_count"],
  );
}
