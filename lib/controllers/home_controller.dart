import '../models/movie_model.dart';
import '../services/api_service.dart';

class HomeController {
  final ApiService _apiService = ApiService();
  List<Movie> movies = [];

  Future<void> fetchAllMovies() async {
    movies = await _apiService.fetchMovies('all');
  }
}
