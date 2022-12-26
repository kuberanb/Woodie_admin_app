
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController{
  
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final availableQuantity = TextEditingController();

  final menuItems =  [
  const  DropdownMenuItem(child: Text("Sofa"),value: "Sofa"),
  const  DropdownMenuItem(child: Text("Chair"),value: "Chair"),
  const  DropdownMenuItem(child: Text("Table"),value: "Table"),
  const  DropdownMenuItem(child: Text("Kitchen"),value: "Kitchen"),
  const  DropdownMenuItem(child: Text("Lamp"),value: "Lamp"),
  const  DropdownMenuItem(child: Text("Cupboard"),value: "Cupboard"),
  const  DropdownMenuItem(child: Text("Vase"),value: "Vase"),
  const  DropdownMenuItem(child: Text("Others"),value: "Others"),


  ];



  //   var items = [   
  //   'Sofa',
  //   'Chair',
  //   'Table',
  //   'Kitchen',
  //   'Lamp',
  //   'Cupboard',
  //   'Vase',
  //   'Others',    
  // ];


}