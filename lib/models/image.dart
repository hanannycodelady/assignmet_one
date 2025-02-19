class LatestMovie {
  final String title;
  final String? overview;
  final String? posterPath;
  final String releaseDate;
  final double voteAverage;
  final int voteCount;

  LatestMovie({
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
  });

  factory LatestMovie.fromJson(Map<String, dynamic> json) {
    return LatestMovie(
      title: json['title'] ?? 'No Title',
      overview: json['overview'] ?? 'No Overview Available',
      posterPath: json['poster_path'],
      releaseDate: json['release_date'] ?? 'Unknown',
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
    );
  }
}
// display the latest movies on the home screen ,work witherror handling and asynprogramming ,the future bilder widgetsand ensure that they are displayed horizontallyand scrollable 