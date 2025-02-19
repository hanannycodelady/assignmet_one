
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/utils/constants.dart';
import '../models/movie.dart';



class MovieService {
  final String baseUrl;
  final String apiKey;

  MovieService({required this.baseUrl, required this.apiKey});

  Future<List<Movie>> fetchMovies() async {
    final response = await http.get(Uri.parse('$baseurl/movie/popular?api_key=$API_KEY'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      return data.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load latest movies');
    }
  }
}