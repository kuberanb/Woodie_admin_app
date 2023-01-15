
// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel? productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel? data) => json.encode(data!.toJson());

class ProductModel {
  ProductModel({
   required this.productCategory,
   required this.productDescription,
   required this.productId,
   required this.productImages,
   required this.productName,
   required this.productPrice,
  });

  String? productCategory;
  String? productDescription;
  String? productId;
  List<String?>? productImages;
  String? productName;
  int? productPrice;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productCategory: json["productCategory"],
        productDescription: json["productDescription"],
        productId: json["productId"],
        productImages: json["productImages"] == null
            ? []
            : List<String?>.from(json["productImages"]!.map((x) => x)),
        productName: json["productName"],
        productPrice: json["productPrice"],
      );

  Map<String, dynamic> toJson() => {
        "productCategory": productCategory,
        "productDescription": productDescription,
        "productId": productId,
        "productImages": productImages == null
            ? []
            : List<dynamic>.from(productImages!.map((x) => x)),
        "productName": productName,
        "productPrice": productPrice,
      };
}
