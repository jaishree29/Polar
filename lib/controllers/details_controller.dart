import '../models/movie_model.dart';

class DetailsController {
  Movie? selectedMovie;

  void setMovie(Movie movie) {
    selectedMovie = movie;
  }
}
