class Review {
  final String author;
  final String content;
  final String createdAt;
  final String avatarPath;
  final double? rating;

  Review({
    required this.author,
    required this.content,
    required this.createdAt,
    required this.avatarPath,
    this.rating,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    final authorDetails = json['author_details'] ?? {};

    return Review(
      author: json['author'] ?? 'Unknown Author',
      content: json['content'] ?? 'No content available',
      createdAt: json['created_at'] ?? '',
      avatarPath: _getAvatarUrl(authorDetails['avatar_path']),
      rating: (authorDetails['rating'] as num?)?.toDouble(), 
    );
  }

  static String _getAvatarUrl(String? path) {
    if (path == null || path.isEmpty) {
      return 'https://via.placeholder.com/100';
    }
    if (path.startsWith('/https')) {
      return path.substring(1); 
    }
    return 'https://image.tmdb.org/t/p/w200$path'; 
  }
}
