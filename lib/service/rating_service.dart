import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/ratings.dart';


class RatingService {
  final String baseUrl = "https://api.themoviedb.org/3/movie";
  final String apiKey = "fd1d995c201ec36d08d42e410b7b4bfc";
  final String sessionId = "2"; 

  Future<bool> submitRating(int movieId, double ratingValue) async {
    final url = Uri.parse('$baseUrl/$movieId/rating?api_key=$apiKey&session_id=$sessionId');

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(Rating(value: ratingValue).toJson()),
      );

      if (response.statusCode == 201) {
        print("Rating submitted successfully.");
        return true;
      } else {
        print("Failed to submit rating: ${response.body}");
        return false;
      }
    } catch (e) {
      print("Error submitting rating: $e");
      return false;
    }
  }
}

// Main function for testing the service
void main() async {
  RatingService ratingService = RatingService();
  int testMovieId = 550; 
  double ratingValue = 8.5; 

  print('Submitting rating for movie ID $testMovieId...');

  bool success = await ratingService.submitRating(testMovieId, ratingValue);
  if (success) {
    print('Rating submitted successfully!');
  } else {
    print('Failed to submit rating.');
  }
}
