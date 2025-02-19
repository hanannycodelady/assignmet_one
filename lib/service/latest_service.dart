import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/latest_movies.dart';


class LatestMoviesService {
  final String apiUrl = "https://api.themoviedb.org/3/movie/latest";
  final String apiKey = "fd1d995c201ec36d08d42e410b7b4bfc";

  Future<LatestMovie?> fetchLatestMovie() async {
    try {
      final response = await http.get(Uri.parse('$apiUrl?api_key=$apiKey'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return LatestMovie.fromJson(jsonData);
      } else {
        throw Exception('Failed to load latest movie: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching latest movie: $e');
      return null;
    }
  }
}

// Main function to test fetching the latest movie
void main() async {
  LatestMoviesService latestMoviesService = LatestMoviesService();

  print('Fetching the latest movie...');

  try {
    final latestMovie = await latestMoviesService.fetchLatestMovie();
    if (latestMovie != null) {
      print('Latest Movie fetched successfully:');
      print('Title: ${latestMovie.title}');
      print('Overview: ${latestMovie.overview}');
      print('Release Date: ${latestMovie.releaseDate}');
    } else {
      print('No latest movie found.');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}