class ProductModel {
  final String id;
  final String name;
  final double price;
  final String description;
  final String imageUrl; // Mengubah type menjadi String

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
  });

  // Convert ProductModel to JSON
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'description': description,
        'imageUrl': imageUrl,
      };

  // Create a ProductModel from JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        description: json['description'],
        imageUrl: json['imageUrl'], // Mengambil imageUrl dari JSON
      );
}
