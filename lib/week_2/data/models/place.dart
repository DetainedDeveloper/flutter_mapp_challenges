class Place {
  final String place, country, imageUrl, about;
  final int cost;

  const Place({
    required this.place,
    required this.country,
    required this.imageUrl,
    required this.about,
    required this.cost,
  });

  factory Place.fromJson(Map<String, dynamic> data) {
    return Place(
      place: data['place'],
      country: data['country'],
      imageUrl: data['imageUrl'],
      about: data['about'],
      cost: data['cost'],
    );
  }
}
