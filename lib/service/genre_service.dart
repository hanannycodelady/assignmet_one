

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/genre.dart';
import '../utils/constants.dart';



class GenreService {
  // final String apiUrl = "https://api.themoviedb.org/3/genre/movie/list";
  // final String apiKey = "fd1d995c201ec36d08d42e410b7b4bfc";

  Future<List<Genre>> fetchGenres() async {
    try {
      final response = await http.get(Uri.parse('$baseurl?api_key=$API_KEY'));
      if (response.statusCode == 200) {
        final List<dynamic> genreJson = json.decode(response.body)['genres'];
        return genreJson.map((json) => Genre.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load genres: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching genres: $e');
      return [];
    }
  }
}
// Main function to run independently
void main() async {
  GenreService genreService = GenreService();

  print('Fetching genres...');
 
  try {
    final genres = await genreService.fetchGenres();
    if (genres.isNotEmpty) {
      print('Genres fetched successfully:');
      for (var genre in genres) {
        print('Genre: ${genre.name}');
      }
    } else {
      print('No genres found.');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}