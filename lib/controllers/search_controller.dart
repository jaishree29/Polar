import '../models/movie_model.dart';
import '../services/api_service.dart';

class PSearchController {
  final ApiService _apiService = ApiService();
  List<Movie> searchResults = [];

  Future<void> searchMovies(String query) async {
    searchResults = await _apiService.fetchMovies(query);
  }
}
