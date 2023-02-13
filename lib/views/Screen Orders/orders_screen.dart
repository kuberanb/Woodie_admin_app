import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woodie_admin/controllers/order_controller.dart';
import 'package:woodie_admin/core/palettes/colorPalettes.dart';
import 'package:woodie_admin/views/Screen%20Orders/order_item.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final orderController = Get.put(OrderController());
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        title: const Text(
          'Orders',
          style: TextStyle(color: kWhiteColor, fontSize: 24),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.exit_to_app_sharp,
              color: kWhiteColor,
              size: 30,
            ),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: orderController.getAllOrders(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: kWhiteColor,
                strokeWidth: 2,
              ),
            );
          } else if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text(
                  'No Orders Available',
                  style: TextStyle(color: kWhiteColor, fontSize: 20),
                ),
              );
            } else {
              return ListView.separated(
                  itemBuilder: ((context, index) =>
                      OrderItem(orderItem: snapshot.data![index])),
                  separatorBuilder: ((context, index) => SizedBox(
                        height: 0.01 * screenHeight,
                      )),
                  itemCount: snapshot.data!.length);
            }
          } else {
            return SizedBox(
              height: screenHeight,
              width: screenWidth,
              child: const Center(
                child: Text(
                  'Something Went Wrong',
                  style: TextStyle(color: kWhiteColor, fontSize: 20),
                ),
              ),
            );
          }
        }),
      ),

      // ListView.builder(
      //   itemCount: 15,
      //   itemBuilder: ((context, index) {
      //     return OrderScreenListTile(
      //         orderNo: index,
      //         orderTime: '10 Dec',
      //         itemName: 'Woodie Sofa',
      //         price: 18000);
      //   }),
      // ),
    );
  }
}

// class OrderScreenListTile extends StatelessWidget {
//   int orderNo;
//   String orderTime;
//   String itemName;
//   int quantity;
//   int price;

//   OrderScreenListTile(
//       {super.key,
//       required this.orderNo,
//       required this.orderTime,
//       required this.itemName,
//       this.quantity = 1,
//       required this.price});

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//     return GestureDetector(
//       onTap: () {
//         // Navigator.of(context).push(
//         //   MaterialPageRoute(
//         //     builder: ((context) =>   TrackOrders()),
//         //   ),
//         // );
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//           decoration: BoxDecoration(
//             color: kListTileColor,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           height: 0.19 * screenHeight,
//           width: double.infinity,
//           //  color: kGreyColor,
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Column(children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Order ${orderNo + 1}',
//                     style: const TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: kWhiteColor),
//                   ),
//                   const CircleAvatar(
//                     radius: 6,
//                     backgroundColor: kLightGreen,
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 0.01 * screenHeight,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Order at $orderTime',
//                     style: TextStyle(color: kWhiteColor),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 0.005 * screenHeight,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'Item Name: ',
//                     style: TextStyle(
//                       color: kWhiteColor,
//                       fontSize: 17,
//                     ),
//                   ),
//                   Text(
//                     itemName,
//                     style: const TextStyle(color: kGreyColor, fontSize: 16),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 0.005 * screenHeight,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'Quantity: ',
//                     style: TextStyle(color: kWhiteColor, fontSize: 17),
//                   ),
//                   Text(
//                     quantity.toString(),
//                     style: const TextStyle(color: kGreyColor, fontSize: 16),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 0.005 * screenHeight,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'Price: ',
//                     style: TextStyle(color: kWhiteColor, fontSize: 17),
//                   ),
//                   Text(
//                     price.toString(),
//                     style: const TextStyle(color: kGreyColor, fontSize: 16),
//                   ),
//                 ],
//               ),
//             ]),
//           ),
//         ),
//       ),
//     );
//   }
// }
