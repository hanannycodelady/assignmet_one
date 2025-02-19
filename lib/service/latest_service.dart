import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/latest_movies.dart'; // Ensure the correct model

class LatestMoviesService {
  final String apiUrl = "https://api.themoviedb.org/3/movie/now_playing";  // Endpoint for latest movies
  final String apiKey = "fd1d995c201ec36d08d42e410b7b4bfc";  // API Key

  Future<List<LatestMovie>?> fetchLatestMovies() async {
    try {
      final response = await http.get(Uri.parse('$apiUrl?api_key=$apiKey'));

      // Print the raw API response for debugging
      print('API Response: ${response.body}');

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        // Check if 'results' is present in the response
        if (jsonData['results'] != null) {
          List<dynamic> results = jsonData['results']; // Get the results array
          return results.map((movieJson) => LatestMovie.fromJson(movieJson)).toList();
        } else {
          throw Exception('No results found in the response.');
        }
      } else {
        throw Exception('Failed to load latest movies: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching latest movies: $e');
      return null;
    }
  }
}

// Example to fetch and print latest movies
void main() async {
  LatestMoviesService latestMoviesService = LatestMoviesService();

  print('Fetching the latest movies...');

  try {
    final List<LatestMovie>? latestMovies = await latestMoviesService.fetchLatestMovies();
    if (latestMovies != null && latestMovies.isNotEmpty) {
      print('Latest Movies fetched successfully:');
      for (var movie in latestMovies) {
        print('Title: ${movie.title}');
        print('Overview: ${movie.overview}');
        print('Release Date: ${movie.releaseDate}');
        print('Poster Path: ${movie.posterPath ?? "No poster available"}');
        print('-------------------');
      }
    } else {
      print('No latest movies found.');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}
