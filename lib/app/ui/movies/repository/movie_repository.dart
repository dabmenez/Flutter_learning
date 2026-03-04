import '../model/movie.dart';
import '../provider/movie_provider.dart';

class MovieRepository {
  final MovieProvider _provider = MovieProvider();

  Future<void> addMovie(Movie movie) async {
    await _provider.addMovie(movie);
  }

  Future<List<Movie>> getAllMovies() async {
    return await _provider.getAllMovies();
  }
}
