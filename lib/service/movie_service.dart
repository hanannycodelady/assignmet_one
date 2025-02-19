// lib/services/movie_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/movie.dart';


class MovieService {
  final String apiUrl = "https://api.themoviedb.org/3/movie";
  final String apiKey = "fd1d995c201ec36d08d42e410b7b4bfc";

  Future<List<Movie>> fetchMovies() async {
    try {
      final response =
          await http.get(Uri.parse('$apiUrl/popular?api_key=$apiKey'));
      if (response.statusCode == 200) {
        final List<dynamic> movieJson = json.decode(response.body)['results'];
        return movieJson.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load movies: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching movies: $e');
      return [];
    }
  }
}

// Main function to test fetching movies
void main() async {
  MovieService movieService = MovieService();

  print('Fetching movies...');

  try {
    final movies = await movieService.fetchMovies();
    if (movies.isNotEmpty) {
      print('Movies fetched successfully:');
      for (var movie in movies) {
        print('Movie: ${movie.title}');
      }
    } else {
      print('No movies found.');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}