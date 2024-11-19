class Merch {
  final String name;
  final String artist;
  final String desc;
  final String merchtype; // Rename this to 'type'
  final String category;
  final String fandom;
  final double price;
  final String imagePath;
  final double rating;

  // Constructor
  Merch({
    required this.name,
    required this.artist,
    required this.desc,
    required this.merchtype,
    required this.category,
    required this.fandom,
    required this.price,
    required this.imagePath,
    required this.rating,
  });
}
