class Recipe {
  final int id;
  final String name;
  final double rating;
  final String image;
   Recipe({
    required this.id,
    required this.name,
    required this.rating,
    required this.image,
  });
  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      name: json['name'] ,
      rating: (json['rating'] as num).toDouble(),
      image: json['image'] ,
    );
  }
}