
// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    required this.orderId,
    required this.productName,
    required this.imageUrl,
    required this.price,
    required this.cartCount,
    required this.payment,
    required this.userEmail,
    required this.address,
    this.isCompleted = false,
    this.isCancelled = false,
    this.deliveryProcessStage = 0,
  });

  String orderId;
  String productName;
  String imageUrl;
  int price;
  int cartCount;
  String payment;
  String userEmail;
  String address;
  bool isCompleted;
  bool isCancelled;
  int deliveryProcessStage;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        orderId: json["orderId"],
        productName: json["productName"],
        imageUrl: json["imageUrl"],
        price: json["price"],
        cartCount: json["cartCount"],
        payment: json["payment"],
        userEmail: json["userEmail"],
        address: json["address"],
        isCompleted: json["isCompleted"],
        isCancelled: json["isCancelled"],
        deliveryProcessStage: json["deliveryProcessStage"],
      );

  Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "productName": productName,
        "imageUrl": imageUrl,
        "price": price,
        "cartCount": cartCount,
        "payment": payment,
        "userEmail": userEmail,
        "address": address,
        "isCompleted": isCompleted,
        "isCancelled": isCancelled,
        "deliveryProcessStage": deliveryProcessStage,
      };
}