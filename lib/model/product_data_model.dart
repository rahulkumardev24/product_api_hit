import 'package:product_api_hit/model/product_model.dart';

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