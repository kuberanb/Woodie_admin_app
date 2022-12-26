import 'package:flutter/material.dart';
import 'package:woodie_admin/palettes/colorPalettes.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor, 
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        title: const Text(
          'Orders',
          style: TextStyle(color: kWhiteColor,fontSize: 24), 
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        
        itemCount: 15,
        itemBuilder: ((context, index) {
          return OrderScreenListTile(orderNo: index, orderTime: '10 Dec', itemName: 'Woodie Sofa', price: 18000);
        }),
      ),
    );
  }
}

class OrderScreenListTile extends StatelessWidget {
  int orderNo;
  String orderTime;
  String itemName;
  int quantity;
  int price;
  
  OrderScreenListTile(
      {super.key, required this.orderNo, required this.orderTime,required this.itemName,this.quantity=1,required this.price});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (){},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          
          decoration: BoxDecoration(
            color: kListTileColor,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 0.17*screenHeight,
          width: double.infinity,
         //  color: kGreyColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Order ${orderNo+1}',style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: kWhiteColor),),
                ],
              ),
    
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Order at $orderTime',style: TextStyle(color: kWhiteColor),),
                ],
              ),
              SizedBox(height: 5,),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                const  Text('Item Name: ',style: TextStyle(color: kWhiteColor,fontSize: 17,),),
                  Text(itemName,style: const TextStyle(color: kGreyColor,fontSize: 16),),
    
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                const  Text('Quantity: ',style: TextStyle(color: kWhiteColor,fontSize: 17),),
                  Text(quantity.toString(),style: const TextStyle(color: kGreyColor,fontSize: 16),),
    
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                const  Text('Price: ',style: TextStyle(color: kWhiteColor,fontSize: 17),),
                  Text(price.toString(),style: const TextStyle(color: kGreyColor,fontSize: 16),),  
    
                ], 
              ),
    
            ]
            ),
          ),
        ),
      ),
    );
  }
}
