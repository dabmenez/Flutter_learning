class Movie {
  String? id;
  String title;
  String description;
  String directors;
  String synopsis;
  String imageBase64;
  String createdBy;

  Movie({
    this.id,
    required this.title,
    required this.description,
    required this.directors,
    required this.synopsis,
    this.imageBase64 = '',
    this.createdBy = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'directors': directors,
      'synopsis': synopsis,
      'imageBase64': imageBase64,
      'createdBy': createdBy,
    };
  }

  factory Movie.fromJson(String id, Map<String, dynamic> json) {
    return Movie(
      id: id,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      directors: json['directors'] ?? '',
      synopsis: json['synopsis'] ?? '',
      imageBase64: json['imageBase64'] ?? '',
      createdBy: json['createdBy'] ?? '',
    );
  }
}
