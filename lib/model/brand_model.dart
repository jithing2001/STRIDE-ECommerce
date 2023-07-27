class BrandModel {
  final String category;
  final String image;

  BrandModel({required this.category, required this.image});

  Map<String, dynamic> toJson() => {
        'category': category,
        'image': image,
      };

  static BrandModel fromJson(Map<String, dynamic> json) => BrandModel(
        category: json['category'],
        image: json['image'],
      );

    
}
