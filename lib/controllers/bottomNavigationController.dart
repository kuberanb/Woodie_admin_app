
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woodie_admin/core/palettes/colorPalettes.dart';
import 'package:woodie_admin/views/addProducts_screen.dart';
import 'package:woodie_admin/views/orders_screen.dart';
import 'package:woodie_admin/views/productsList_screen.dart';

class BottomNavigationController extends GetxController{

var selectedValue = 0.obs;

void changeIndex(int index){
  selectedValue.value = index;
}

final bottomNavigationItems = <BottomNavigationBarItem>[

  const BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_outlined),label: 'Orders',backgroundColor: kListTileColor),
  const BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart_outlined),label: 'Add Products',backgroundColor: kListTileColor),
  const BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_outlined),label: 'Products List',backgroundColor: kListTileColor),

];

final pages = [
 const OrdersScreen(),
 const AddProducts(), 
 const ProductsList(),
];

}