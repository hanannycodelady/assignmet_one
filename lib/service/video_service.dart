import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/video.dart';

class VideoService {
  final String baseUrl = "https://api.themoviedb.org/3/movie";
  final String apiKey = "fd1d995c201ec36d08d42e410b7b4bfc";

  Future<List<Video>> fetchVideos(int movieId) async {
    final url = Uri.parse('$baseUrl/$movieId/videos?api_key=$apiKey');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> videosJson = json.decode(response.body)['results'] ?? [];
        return videosJson.map((json) => Video.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load videos: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching videos: $e');
      return [];
    }
  }
}

// Main function for testing the service
void main() async {
  VideoService videoService = VideoService();
  int testMovieId = 550; 

  print('Fetching videos for movie ID $testMovieId...');

  List<Video> videos = await videoService.fetchVideos(testMovieId);

  if (videos.isNotEmpty) {
    print('Videos fetched successfully:');
    for (var video in videos) {
      print('Title: ${video.name}, YouTube Key: ${video.key}');
    }
  } else {
    print('No videos found.');
  }
}
