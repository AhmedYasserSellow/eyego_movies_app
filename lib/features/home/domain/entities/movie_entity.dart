class MovieEntity {
  final String title;
  final String posterPath;
  final String backdropPath;
  final String overview;
  final String releaseDate;
  final String genre;
  final double voteAverage;
  final int id;

  const MovieEntity({
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.genre,
    required this.backdropPath,
    required this.id,
  });

  toMap() {
    return {
      'title': title,
      'posterPath': posterPath,
      'overview': overview,
      'releaseDate': releaseDate,
      'voteAverage': voteAverage,
      'genre': genre,
      'backdropPath': backdropPath,
      'id': id,
    };
  }
}
