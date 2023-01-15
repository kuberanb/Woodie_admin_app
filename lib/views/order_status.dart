import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woodie_admin/controllers/orderStatus_controller.dart';
import 'package:woodie_admin/core/palettes/colorPalettes.dart';
import 'package:woodie_admin/views/productsList_screen.dart';

class OrderStatus extends StatelessWidget {
  const OrderStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final controller = Get.put(OrderStatusController());
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: kBackgroundColor,
        elevation: 0,
        title: const Text(
          'Order Status',
          style: TextStyle(color: kWhiteColor, fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductsListTile(
              productTitle: 'Chair',
              productPrice: 300, 
              categoryName: 'Other',
              imageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTi-Nt1XqnxEtDifFYK_alfVj8nafXSp7k9hA&usqp=CAU',
            ),


            Padding(
              padding: const EdgeInsets.only(left:16.0,right:8),
              child: AnotherStepper( 
                activeBarColor: kWhiteColor, 

                stepperList: controller.orderStatusData,
                stepperDirection: Axis.vertical,
                activeIndex: 2,
                gap: 50,  
                // iconWidth:
                //     40, 
                // iconHeight:
                //     40,  
              ), 
            ),
            
             
          ],
        ),
      ),
    );
  }
}
