/// meta model
class MetaModel {
  String? barcode;
  String? createdAt;
  String? qrCode;
  String? updatedAt;

  MetaModel({this.barcode, this.createdAt, this.qrCode, this.updatedAt});

  factory MetaModel.fromJson(Map<String, dynamic> json) {
    return MetaModel(
      createdAt: json['createdAt'],
      barcode: json['barcode'],
      qrCode: json['qrCode'],
      updatedAt: json['updatedAt'],
    );
  }
}

/// reviews model
class ReviewsModel {
  String? comment;
  String? date;
  String? reviewerEmail;
  String? reviewerName;
  num? rating;
  ReviewsModel(
      {this.comment,
      this.date,
      this.reviewerEmail,
      this.reviewerName,
      this.rating});

  factory ReviewsModel.fromJson(Map<String, dynamic> json) {
    return ReviewsModel(
        comment: json['comment'],
        date: json['date'],
        reviewerEmail: json['reviewerEmail'],
        reviewerName: json['reviewerName'],
        rating: json['rating']);
  }
}

/// dimensions model
class DimensionsModel {
  num? depth;
  num? height;
  num? width;

  DimensionsModel({this.depth, this.height, this.width});

  factory DimensionsModel.fromJson(Map<String, dynamic> json) {
    return DimensionsModel(
      depth: json['depth'],
      height: json['height'],
      width: json['width'],
    );
  }
}

/// product model
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
  DimensionsModel? dimensions;
  MetaModel? meta;
  num? id;
  num? price;
  num? rating;
  num? stock;
  num? weight;
  int? minimumOrderQuantity;
  List<dynamic>? images;
  List<ReviewsModel>? reviews; //
  List<dynamic>? tags;

  /// constructor
  ProductModel(
      {this.id,
      this.title,
      this.description,
      this.availabilityStatus,
      this.price,
      this.rating,
      this.weight,
      this.minimumOrderQuantity,
      this.dimensions,
      this.meta,
      this.brand,
      this.category,
      this.stock,
      this.discountPercentage,
      this.images,
      this.reviews,
      this.returnPolicy,
      this.thumbnail,
      this.warrantyInformation,
      this.tags});

  /// from Map
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    List<ReviewsModel> mReviews = [];
    for (Map<String, dynamic> eachReview in json['reviews']) {
      mReviews.add(ReviewsModel.fromJson(eachReview));
    }
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
        dimensions: DimensionsModel.fromJson(json['dimensions']),
        meta: MetaModel.fromJson(json['meta']),
        reviews: mReviews,
        tags: json['tags']);
  }
}

class ProductDataModel {
  int? limit;
  int? skip;
  int? total;
  List<ProductModel>? products;

  ProductDataModel(
      {required this.total,
      required this.skip,
      required this.limit,
      required this.products});

  /// from json ;
  factory ProductDataModel.fromJson(Map<String, dynamic> json) {
    List<ProductModel> mProducts = [];
    for (var eachData in json['products']) {
      mProducts.add(ProductModel.fromJson(eachData));
    }
    return ProductDataModel(
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
      products: mProducts, // Corrected assignment
    );
  }
}
