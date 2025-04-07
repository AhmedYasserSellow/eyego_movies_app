import 'package:eyego_movies_app/features/home/domain/entities/movie_entity.dart';

const double kBorderRadius = 16.0;
const double kHorizontalPadding = 24.0;
const String apikey = '34fe49bc07ba95019d4dc599c9c2a811';
const MovieEntity kDefaultMovie = MovieEntity(
  id: 0,
  title: '',
  posterPath: '',
  overview: '',
  releaseDate: '',
  voteAverage: 0.0,
  genre: '',
  backdropPath: '',
);

const List<MovieEntity> fakeMovieList = [
  kDefaultMovie,
  kDefaultMovie,
  kDefaultMovie,
  kDefaultMovie,
  kDefaultMovie,
];
