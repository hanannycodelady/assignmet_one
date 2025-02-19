import 'package:flutter/material.dart';
import 'package:movie_app/service/movie_service.dart';
import '../models/movie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies App'),
      ),
      body: FutureBuilder<List<Movie>?>(
        future: MovieService().fetchLatestMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No latest movies found'));
          }

          final movies = snapshot.data!;

          return SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal, 
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: movie.posterPath.isNotEmpty
                            ? Image.network(
                                'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                                width: 100, 
                                height: 120, 
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.movie, size: 120),
                              )
                            : const Icon(Icons.movie, size: 120),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: 120,
                        child: Text(
                          movie.title,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
