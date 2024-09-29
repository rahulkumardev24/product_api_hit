import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:product_api_hit/model/product_data_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Product screen"),
        ),
        body: FutureBuilder(
            future: getProduct(),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snap.hasError) {
                return Center(
                  child:
                      Text("Error: ${snap.error}"), // Corrected error display
                );
              } else if (snap.hasData) {
                return snap.data != null
                    ? ListView.builder(
                        itemCount: snap.data!.products!.length,
                        itemBuilder: (context, index) {
                          ProductModel eachProduct =
                              snap.data!.products![index];

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 5,
                              shadowColor: Colors.black87,
                              child: Column(
                                children: [
                                  Image.network(eachProduct.thumbnail!),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          eachProduct.title!,
                                          maxLines: 2,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Price : ${eachProduct.price.toString()}",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(width: 5,) ,
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5) ,
                                                color: Colors.black26
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child: Text(
                                                  "${eachProduct.discountPercentage
                                                      .toString()}% off "
                                                  ,
                                                  style: const TextStyle(
                                                    color: Colors.green,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.orangeAccent,
                                            ),
                                            Text(
                                              "Rating : ${eachProduct.rating.toString()}",
                                              style: const TextStyle(),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ) , 
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Text(eachProduct.description!),
                                  )
                                ],
                              ),
                            ),
                          );
                        })
                    : const Center(
                        child: Text("No Data Found!"),
                      );
              }
              return Container();
            }));
  }

  Future<ProductDataModel?> getProduct() async {
    ProductDataModel? productDataModel;
    String url = "https://dummyjson.com/products";
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri);

    if (res.statusCode == 200) {
      print("Response body : ${res.body}");
      var resData = jsonDecode(res.body);
      productDataModel = ProductDataModel.fromJson(resData);
    }
    return productDataModel; // Moved outside the condition
  }
}
