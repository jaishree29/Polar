import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';

class ApiService {
  static const String baseUrl = 'https://api.tvmaze.com/';

  Future<List<Movie>> fetchMovies(String query) async {
    final response =
        await http.get(Uri.parse('${baseUrl}search/shows?q=$query'));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((movieJson) => Movie.fromJson(movieJson)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
