class Book {
  final String id;
  final String title;
  final List<String> authors;
  final String publisher;
  final String publishedDate;
  final String description;
  final String language;
  final String smallThumbnail;
  final String thumbnail;
  final String previewLink;
  final String infoLink;
  final String canonicalVolumeLink;

  const Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.publisher,
    required this.publishedDate,
    required this.description,
    required this.language,
    required this.smallThumbnail,
    required this.thumbnail,
    required this.previewLink,
    required this.infoLink,
    required this.canonicalVolumeLink,
  });

  factory Book.fromMap(Map<String, dynamic> json) {
    return Book(
      id: json['id'] ?? 'Unknown',
      title: json['title'] ?? 'Unknown',
      authors: json.containsKey('authors')
          ? List<String>.from(json['authors'].map((author) => author))
          : ['Unknown'],
      publisher: json['publisher'] ?? 'Unknown',
      publishedDate: json.containsKey('publishedDate') ? json['publishedDate'] : 'Unknown',
      description: json['description'] ?? 'Unknown',
      language: json['language'] ?? 'Unknown',
      smallThumbnail: json['smallThumbnail'] ?? 'Unknown',
      thumbnail: json['thumbnail'] ?? 'Unknown',
      previewLink: json['previewLink'] ?? 'Unknown',
      infoLink: json['infoLink'] ?? 'Unknown',
      canonicalVolumeLink: json['canonicalVolumeLink'] ?? 'Unknown',
    );
  }
}
