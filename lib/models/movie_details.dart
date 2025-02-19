// import 'genre.dart';
// import 'Actor.dart';
// import 'crew.dart';

// class MovieDetail {
//   final int id;
//   final String title;
//   final String? overview;
//   final String? posterPath;
//   final double voteAverage;
//   final String? releaseDate;
//   final List<Genre> genres;
//   final List<Cast> cast;
//   final List<Crew> crew;

//   MovieDetail({
//     required this.id,
//     required this.title,
//     this.overview,
//     this.posterPath,
//     this.voteAverage = 0.0,
//     this.releaseDate,
//     List<Genre>? genres,
//     List<Cast>? cast,
//     List<Crew>? crew,
//   })  : genres = genres ?? [],
//         cast = cast ?? [],
//         crew = crew ?? [];
// // the map means a dictionary
//   factory MovieDetail.fromJson(Map<String, dynamic> json) {
//     return MovieDetail(
//       id: json['id'] ?? 0,
//       title: json['title'] ?? 'Unknown Title',
//       overview: json['overview'],
//       posterPath: json['poster_path'],
//       voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
//       releaseDate: json['release_date'],
//       genres: (json['genres'] as List<dynamic>?)?.map((e) => Genre.fromJson(e)).toList() ?? [],
//       cast: (json['credits']?['cast'] as List<dynamic>?)?.map((e) => Cast.fromJson(e)).toList() ?? [],
//       crew: (json['credits']?['crew'] as List<dynamic>?)?.map((e) => Crew.fromJson(e)).toList() ?? [],
//     );
//   }
// }
