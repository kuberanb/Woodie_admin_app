import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woodie_admin/controllers/order_controller.dart';
import 'package:woodie_admin/core/constants.dart';
import 'package:woodie_admin/core/palettes/colorPalettes.dart';
import 'package:woodie_admin/functions/miscellaneous_functions.dart';
import 'package:woodie_admin/models/order_model.dart';

class OrderSettings extends StatelessWidget {
  OrderSettings({super.key, required this.orderItem});
  final OrderModel orderItem;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final orderController = Get.put(OrderController());
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Text(
          'Order Settings',
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 22,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: kWhiteColor,
            size: 22,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            right: 0.03 * screenWidth,
            left: 0.03 * screenWidth,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                Container(
                  width: screenWidth,
                  height: 0.07 * screenHeight,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kListTileColor),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Cancel Order',
                          style: TextStyle(
                            color: kPrefixIconColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () async {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: ((context) => const Center(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: kWhiteColor,
                                    ),
                                  )),
                            );

                            try {
                              await FirebaseFirestore.instance
                                  .collection(orders)
                                  .doc(orderItem.orderId)
                                  .update({
                                'isCancelled': true,
                                'isCompleted': false,
                              });

                              errorSnackBar(
                                  'Order Cancelled Sucessfully', context);
                            } catch (e) {
                              errorSnackBar(e.toString(), context);
                            }
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.close,
                            color: kWhiteColor,
                            size: 20,
                          ),
                          label: const Text(
                            'Cancel',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 18,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(kLightRedColor),
                            elevation: MaterialStateProperty.all(0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                Container(
                  width: screenWidth,
                  height: 0.07 * screenHeight,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kListTileColor),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Delivery Completed',
                          style: TextStyle(
                            color: kPrefixIconColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () async {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: ((context) => const Center(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: kWhiteColor,
                                    ),
                                  )),
                            );

                            try {
                              await FirebaseFirestore.instance
                                  .collection(orders)
                                  .doc(orderItem.orderId)
                                  .update({
                                'isCompleted': true,
                                'deliveryProcessStage': 5,
                                'isCancelled': false,
                              });
                              log('''isCompleted': true, 'deliveryProcessStage':5 'isCancelled': false ''');
                              errorSnackBar(
                                  'Order Completed Sucessfully', context);
                            } catch (e) {
                              errorSnackBar(e.toString(), context);
                            }
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.check,
                            color: kWhiteColor,
                            size: 20,
                          ),
                          label: const Text(
                            'Yes',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 18,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(kLightGreen),
                            elevation: MaterialStateProperty.all(0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.04 * screenHeight,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Change the delivery Stage of Order',
                    style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                SizedBox(
                  width: screenWidth,
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: 0.03 * screenWidth,
                      left: 0.03 * screenWidth,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '1. Order Placed',
                          style: TextStyle(
                            color: kLightWhiteColor,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 0.02 * screenHeight,
                        ),
                        const Text(
                          '2. Order Packed',
                          style: TextStyle(
                            color: kLightWhiteColor,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 0.02 * screenHeight,
                        ),
                        const Text(
                          '3. Order Shipped',
                          style: TextStyle(
                            color: kLightWhiteColor,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 0.02 * screenHeight,
                        ),
                        const Text(
                          '4. Out for Delivery',
                          style: TextStyle(
                            color: kLightWhiteColor,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 0.02 * screenHeight,
                        ),
                        const Text(
                          '5. Order Delivered',
                          style: TextStyle(
                            color: kLightWhiteColor,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 0.02 * screenHeight,
                        ),
                      ],
                    ),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: orderController.deliverStageController,
                  style: const TextStyle(
                    color: kWhiteColor,
                  ),
                  decoration: InputDecoration(
                    fillColor: kListTileColor,
                    filled: true,
                    hintText: 'Enter Delivery Stage',
                    hintStyle: const TextStyle(
                      color: kWhiteColor,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: kBlackColor,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: kBlackColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                  validator: (value) {
                    // final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
                    if (value == null || value.isEmpty) {
                      return '''Delivery Stage can't be empty''';
                    } else if (value.length > 1) {
                      return ''' Delivery Stage can't be greater than one digit''';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      int num = int.parse(
                          orderController.deliverStageController.text);

                      if (num > 5 || num < 1) {
                        errorSnackBar(
                            '''Delivery Stage can't be greater than 5 and less than 1''',
                            context);
                      } else {
                        log('Entered correct value in Delivery stage');

                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: ((context) => const Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: kWhiteColor,
                                ),
                              )),
                        );

                        if (num == 5) {
                          try {
                            await FirebaseFirestore.instance
                                .collection(orders)
                                .doc(orderItem.orderId)
                                .update({
                              'isCancelled': false,
                              'isCompleted': true,
                              'deliveryProcessStage': int.parse(
                                  orderController.deliverStageController.text)
                            });
                            orderController.deliverStageController.clear();
                            errorSnackBar(
                                'Delivery Process Stage Updated', context);
                          } catch (e) {
                            errorSnackBar(e.toString(), context);
                          }
                        } else {
                          try {
                            await FirebaseFirestore.instance
                                .collection(orders)
                                .doc(orderItem.orderId)
                                .update({
                              'isCancelled': false,
                              'isCompleted': false,
                              'deliveryProcessStage': int.parse(
                                  orderController.deliverStageController.text)
                            });
                            orderController.deliverStageController.clear();
                            errorSnackBar(
                                'Delivery Process Stage Updated', context);
                          } catch (e) {
                            errorSnackBar(e.toString(), context);
                          }
                        }

                        Navigator.of(context).pop();
                      }
                    }
                  },
                  icon: const Icon(
                    Icons.check,
                    color: kWhiteColor,
                    size: 20,
                  ),
                  label: const Text(
                    'Update Delivery Stage',
                    style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 18,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kLightGreyColor),
                    elevation: MaterialStateProperty.all(0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
