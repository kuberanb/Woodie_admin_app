import 'package:another_stepper/another_stepper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woodie_admin/core/constants.dart';
import 'package:woodie_admin/core/palettes/colorPalettes.dart';
import 'package:woodie_admin/models/order_model.dart';

class OrderController extends GetxController {

   final deliverStageController = TextEditingController();



  Stream<List<OrderModel>> getAllOrders() {
    return FirebaseFirestore.instance.collection(orders).snapshots().map(
          (snapshot) => snapshot.docs
              .map(
                (e) => OrderModel.fromJson(e.data()),
              )
              .toList(),
        );
  }

  List<StepperData> orderStatusData = [
    StepperData(
      title: StepperText(
        "Order Placed",
        textStyle: const TextStyle(
          color: kWhiteColor,
        ),
      ),
      subtitle: StepperText("Your order has been placed"),
      // iconWidget: Container(
      //   padding: const EdgeInsets.all(2),
      //   decoration: const BoxDecoration(
      //       color: kBlueColor,
      //       borderRadius: BorderRadius.all(Radius.circular(30))),
      //   child: const Icon(Icons.looks_one, color: Colors.white),
      // ),
    ),
    StepperData(
      title: StepperText(
        "Packed",
        textStyle: const TextStyle(color: kWhiteColor),
      ),
      subtitle: StepperText("Your order is being prepared"),
      // iconWidget: Container(
      //   padding: const EdgeInsets.all(2),
      //   decoration: const BoxDecoration(
      //       color: kBlueColor,
      //       borderRadius: BorderRadius.all(Radius.circular(30))),
      //   child: const Icon(Icons.looks_two, color: Colors.white),
      // ),
    ),
    StepperData(
      title: StepperText(
        "Shipped",
        textStyle: const TextStyle(color: kWhiteColor),
      ),
      subtitle: StepperText("Your Order is Shipped "),
      // iconWidget: Container(
      //   padding: const EdgeInsets.all(2),
      //   decoration: const BoxDecoration(
      //       color: kBlueColor,
      //       borderRadius: BorderRadius.all(Radius.circular(30))),
      //   child: const Icon(Icons.looks_3, color: Colors.white),
      // ),
    ),
    StepperData(
      title: StepperText(
        "Out for Delivery",
        textStyle: const TextStyle(color: kWhiteColor),
      ),
      subtitle: StepperText(
          "Our Delivery executive is on the way to deliver the item"),
      // iconWidget: Container(
      //   padding: const EdgeInsets.all(2),
      //   decoration: const BoxDecoration(
      //       color: kBlueColor,
      //       borderRadius: BorderRadius.all(Radius.circular(30))),
      //   child: const Icon(Icons.looks_3, color: Colors.white),
      // ),
    ),
    StepperData(
      title: StepperText(
        "Order Delivered",
        textStyle: const TextStyle(
          color: kWhiteColor,
        ),
      ),
      // iconWidget: Container(
      //   padding: const EdgeInsets.all(2),
      //   decoration: const BoxDecoration(
      //     color: kBlueColor,
      //     borderRadius: BorderRadius.all(
      //       Radius.circular(30),
      //     ),
      //   ),
      //   child: const Icon(Icons.looks_one, color: Colors.white),
      // ),
    ),
  ];
}
