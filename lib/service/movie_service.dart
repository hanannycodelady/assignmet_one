import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/movie.dart';

class MovieService {
  final String apiUrl = "https://api.themoviedb.org/3/movie/now_playing";  // Endpoint for latest movies
  final String apiKey = "fd1d995c201ec36d08d42e410b7b4bfc";  // API Key

  Future<List<Movie>?> fetchLatestMovies() async {
    try {
      final response = await http.get(Uri.parse('$apiUrl?api_key=$apiKey'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData['results'] != null) {
          List<dynamic> results = jsonData['results']; 
          return results.map((movieJson) => Movie.fromJson(movieJson)).toList();
        } else {
          throw Exception('No results found.');
        }
      } else {
        throw Exception('Failed to load latest movies: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching latest movies: $e');
      return null;  // Return null if there is an error
    }
  }
}
