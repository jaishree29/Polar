class Movie {
  final String title;
  final String imageUrl;
  final String summary;
  final int id;

  Movie({
    required this.title,
    required this.imageUrl,
    required this.summary,
    required this.id,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['show']['name'] ?? '',
      imageUrl: json['show']['image']?['medium'] ?? '',
      summary: json['show']['summary'] ?? '',
      id: json['show']['id'],
    );
  }
}
