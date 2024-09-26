class ProductModel {
  String? availabilityStatus;
  String? brand;
  String? category;
  String? description;
  String? title;
  String? thumbnail;
  String? returnPolicy;
  String? warrantyInformation;
  num? discountPercentage;
  num? id;
  num? price;
  num? rating;
  num? stock;
  num? weight;
  int? minimumOrderQuantity;
  List<dynamic>? images;

  /// constructor
  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.availabilityStatus,
    required this.price,
    required this.rating,
    required this.weight,
    required this.minimumOrderQuantity,
    required this.brand,
    required this.category,
    required this.stock,
    required this.discountPercentage,
    required this.images,
    required this.returnPolicy,
    required this.thumbnail,
    required this.warrantyInformation,
  });

  /// from Map
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      availabilityStatus: json['availabilityStatus'],
      price: json['price'],
      rating: json['rating'],
      weight: json['weight'],
      minimumOrderQuantity: json['minimumOrderQuantity'],
      brand: json['brand'],
      category: json['category'],
      stock: json['stock'],
      discountPercentage: json['discountPercentage'],
      images: json['images'],
      returnPolicy: json['returnPolicy'],
      thumbnail: json['thumbnail'],
      warrantyInformation: json['warrantyInformation'],
    );
  }
}
