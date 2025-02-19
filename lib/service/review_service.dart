import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/review.dart';

class ReviewService {
  final String apiUrl = "https://api.themoviedb.org/3/movie";

  final String apiKey = "fd1d995c201ec36d08d42e410b7b4bfc";

  Future<List<Review>> fetchReviews(int movieId) async {
    try {
      final response = await http.get(Uri.parse('$apiUrl/$movieId/reviews?api_key=$apiKey'));

      if (response.statusCode == 200) {
        final List<dynamic> reviewsJson = json.decode(response.body)['results'] ?? [];
        return reviewsJson.map((json) => Review.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load reviews: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching reviews: $e');
      return [];
    }
  }
}

void main() async {
  ReviewService reviewService = ReviewService();
  int testMovieId = 550;

  print('Fetching reviews for movie ID $testMovieId...');

  try {
    final reviews = await reviewService.fetchReviews(testMovieId);
    if (reviews.isNotEmpty) {
      print('Reviews fetched successfully:');
      for (var review in reviews) {
        print('${review.author}: ${review.content.substring(0, 50)}...');
      }
    } else {
      print('No reviews found.');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}
