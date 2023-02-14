import 'package:flutter/material.dart';
import 'package:woodie_admin/models/order_model.dart';
import 'package:woodie_admin/views/Screen%20Orders/order_item_full_screen.dart';
import 'package:woodie_admin/views/Screen%20Orders/track_orders_screen.dart';

import '../../core/palettes/colorPalettes.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.orderItem});
  final OrderModel orderItem;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => OrderFullScreen(
                  address: orderItem.address,
                  orderId: orderItem.orderId,
                  productName: orderItem.productName,
                  imageUrl: orderItem.imageUrl,
                  productQuantity: orderItem.cartCount,
                  productPrice: orderItem.price,
                  paymentMethod: orderItem.payment,
                  isCompleted: orderItem.isCompleted,
                  isCancelled: orderItem.isCancelled,
                  email: orderItem.userEmail,
                  orderItem: orderItem,
                )),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 0.22 * screenHeight,
        decoration: BoxDecoration(
          color: kListTileColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            right: 0.01 * screenWidth,
            left: 0.01 * screenWidth,
            bottom: 0.01 * screenHeight, 
            top: 0.01 * screenHeight, 
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
                        // 'https://ii1.pepperfry.com/media/catalog/product/a/v/800x880/avilys-solid-wood-coffee-table-in-provincial-teak-finish-by-woodsworth-avilys-solid-wood-coffee-tabl-wqosro.jpg'
                        orderItem.imageUrl,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              // 'Lowson Chair'
                              orderItem.productName,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: kWhiteColor,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: kspecialGrey,
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: ((context) => TrackOrders(
                                          orderItem: orderItem,
                                        )),
                                  ),
                                );
                              },
                              child: const Text(
                                'Track Order',
                                style: TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: 0.01 * screenHeight,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Qty: ${orderItem.cartCount}',
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
                            '₹ ${orderItem.price}',
                            style: const TextStyle(
                              color: kPrefixIconColor,
                              fontSize: 18,
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
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            orderItem.payment,
                            style: const TextStyle(
                              color: kWhiteColor,
                              fontSize: 15,
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
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            (orderItem.isCompleted == true)
                                ? 'Order Completed '
                                : (orderItem.isCancelled == true)
                                    ? 'Order Cancelled'
                                    : 'Delivery in Progress',
                            style: const TextStyle(
                              color: kWhiteColor,
                              fontSize: 16,
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
      ),
    );
  }
}
