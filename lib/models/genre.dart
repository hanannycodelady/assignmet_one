import 'package:json_annotation/json_annotation.dart';
//import 'package:movie_app/models/Genre.dart';

part 'genre.g.dart';

@JsonSerializable()
class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }
}