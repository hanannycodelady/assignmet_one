
class Crew {
  final int id;
  final String name;
  final String? job;
  final String? profilePath;

  Crew({
    required this.id,
    required this.name,
    this.job,
    this.profilePath,
  });

  factory Crew.fromJson(Map<String, dynamic> json) {
    return Crew(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown Crew Member',
      job: json['job'],
      profilePath: json['profile_path'],
    );
  }
}