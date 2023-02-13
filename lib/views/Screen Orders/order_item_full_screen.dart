import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:woodie_admin/core/palettes/colorPalettes.dart';
import 'package:woodie_admin/models/order_model.dart';
import 'package:woodie_admin/views/Screen%20Orders/order_settings.dart';

class OrderFullScreen extends StatelessWidget {
  OrderFullScreen(
      {super.key,
      required this.address,
      required this.orderId,
      required this.productName,
      required this.imageUrl,
      required this.productQuantity,
      required this.productPrice,
      required this.paymentMethod,
      required this.isCompleted,
      required this.isCancelled,
      required this.email,
      required this.orderItem});

  String address;
  String orderId;
  String productName;
  String imageUrl;
  int productQuantity;
  int productPrice;
  String paymentMethod;
  bool isCancelled;
  bool isCompleted;
  String email;
  OrderModel orderItem;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    // final userEmail = FirebaseAuth.instance.currentUser!.email!;
    // final userName = FirebaseAuth.instance.currentUser!.displayName!;

    String getCapitalizedName(String name) {
      final names = name.split(' ');
      String finalName = '';
      for (var n in names) {
        n.trim();
        if (n.isNotEmpty) {
          finalName += '${n[0].toUpperCase()}${n.substring(1)} ';
        }
      }
      return finalName.trim();
    }

    log(getCapitalizedName(address));

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Text(
          'Order FullScreen',
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: kWhiteColor,
            size: 25,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => OrderSettings(
                        orderItem: orderItem,
                      )),
                ),
              );
            },
            icon: const Icon(
              Icons.settings,
              color: kWhiteColor,
              size: 25,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.05 * screenWidth,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 0.01 * screenHeight,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Order ID : $orderId',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: kLightWhiteColor,
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(
                height: 0.01 * screenHeight,
              ),
              const Divider(
                thickness: 1,
                color: kLightGreyColor,
              ),
              SizedBox(
                height: 0.01 * screenHeight,
              ),
              MiniOrderItem(
                productName: productName,
                productQuantity: productQuantity,
                productPrice: productPrice,
                paymentMethod: paymentMethod,
                isCompleted: isCompleted,
                imageUrl:
                    //'https://www.ulcdn.net/images/products/201809/slide/666x363/Truman_Study_Table_Creamy_Crust_Finish_Teak_merc.jpg?1624608693'
                    imageUrl,
                isCancelled: isCancelled,
              ),
              SizedBox(
                height: 0.02 * screenHeight,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Shipping Address',
                  style: TextStyle(
                    color: kPrefixIconColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 0.01 * screenHeight,
              ),
              const Divider(
                thickness: 1,
                color: kLightGreyColor,
              ),
              SizedBox(
                height: 0.01 * screenHeight,
              ),
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Text(
              //     // 'Kuberan B'
              //     userName,
              //     style: const TextStyle(
              //       color: kExtraLightWhiteColor,
              //       fontSize: 18,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 0.01 * screenHeight,
              // ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  getCapitalizedName(address),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: kExtraLightWhiteColor,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 0.01 * screenHeight,
              ),
              const Divider(
                thickness: 1,
                color: kLightGreyColor,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email:',
                  style: TextStyle(
                    color: kPrefixIconColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  // userEmail.toString()
                  email,
                  style: const TextStyle(
                    color: kExtraLightWhiteColor,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 0.01 * screenHeight,
              ),
              const Divider(
                thickness: 1,
                color: kLightGreyColor,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Price Details',
                  style: TextStyle(
                    color: kPrefixIconColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 0.01 * screenHeight,
              ),
              const Divider(
                thickness: 1,
                color: kLightGreyColor,
              ),
              PriceDetailsEachItem(
                title: 'Price',
                value: productPrice,
              ),
              SizedBox(
                height: 0.01 * screenHeight,
              ),
              PriceDetailsEachItem(
                title: 'Quantity',
                value: productQuantity,
              ),
              SizedBox(
                height: 0.01 * screenHeight,
              ),
              PriceDetailsEachItem(
                title: 'Delivery Charge',
                value: 0,
              ),
              SizedBox(
                height: 0.01 * screenHeight,
              ),
              const Divider(
                thickness: 1,
                color: kLightGreyColor,
              ),
              PriceDetailsEachItem(
                title: 'Total Price',
                value: productQuantity * productPrice,
              ),
              const Divider(
                thickness: 1,
                color: kLightGreyColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MiniOrderItem extends StatelessWidget {
  MiniOrderItem(
      {super.key,
      required this.productName,
      required this.productQuantity,
      required this.productPrice,
      required this.paymentMethod,
      required this.isCompleted,
      required this.imageUrl,
      required this.isCancelled});

  String productName;
  int productQuantity;
  int productPrice;
  String paymentMethod;
  bool isCompleted;
  String imageUrl;
  bool isCancelled;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: 0.2 * screenHeight,
      decoration: BoxDecoration(
        color: kListTileColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          right: 0.01 * screenWidth,
          left: 0.01 * screenWidth,
          bottom: 0.02 * screenHeight,
          top: 0.02 * screenHeight,
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: 0.02 * screenWidth,
                left: 0.02 * screenWidth,
              ),
              child: Container(
                height: 0.13 * screenHeight,
                width: 0.2 * screenWidth,
                decoration: BoxDecoration(
                  color: kListTileColor,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      // 'https://www.ulcdn.net/images/products/201809/slide/666x363/Truman_Study_Table_Creamy_Crust_Finish_Teak_merc.jpg?1624608693'
                      imageUrl,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: 0.02 * screenWidth,
                  left: 0.02 * screenWidth,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          //'Lowson Chair'
                          productName,
                          style: const TextStyle(
                            color: kWhiteColor,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 0.01 * screenHeight,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Qty: $productQuantity',
                          style: const TextStyle(
                            color: kPrefixIconColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 0.01 * screenHeight,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '₹ $productPrice',
                          style: const TextStyle(
                            color: kPrefixIconColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 0.01 * screenHeight,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Payment Method :',
                          style: TextStyle(
                            color: kPrefixIconColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          paymentMethod,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: kWhiteColor,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 0.01 * screenHeight,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Order Status :',
                          style: TextStyle(
                            color: kPrefixIconColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          (isCompleted == true)
                              ? 'Order Completed '
                              : (isCancelled == true)
                                  ? 'Order Cancelled'
                                  : 'Delivery in Progress',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: kWhiteColor,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PriceDetailsEachItem extends StatelessWidget {
  PriceDetailsEachItem({super.key, required this.title, required this.value});

  String title;
  int value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: kExtraLightWhiteColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value.toString(),
          style: const TextStyle(
            color: kExtraLightWhiteColor,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
