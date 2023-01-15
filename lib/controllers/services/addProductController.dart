import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddProductController extends GetxController {
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final availableQuantity = TextEditingController();

  final menuItems = [
    const DropdownMenuItem(child: Text("Sofa"), value: "Sofa"),
    const DropdownMenuItem(child: Text("Chair"), value: "Chair"),
    const DropdownMenuItem(child: Text("Table"), value: "Table"),
    const DropdownMenuItem(child: Text("Kitchen"), value: "Kitchen"),
    const DropdownMenuItem(child: Text("Lamp"), value: "Lamp"),
    const DropdownMenuItem(child: Text("Cupboard"), value: "Cupboard"),
    const DropdownMenuItem(child: Text("Vase"), value: "Vase"),
    const DropdownMenuItem(child: Text("Others"), value: "Others"),
  ];

//   RxList<String> _paths = RxList<String>();
//   get paths => _paths.value;

//   Future<void> loadAssets() async {
//     try { 
//       _paths.value = await FilePicker.getMultiFilePath(
//         type: FileType.image,
//         fileExtension: 'jpg;png;jpeg',
//       );
//       print("Images Loaded");
//     } on Exception catch (e) {
//       print("Error Occured while picking the image: $e");
//     }
//     update();
//   }
   
//   Future<void> uploadImages() async {
//     if (_paths.value == null) {
//       print("Please select some images first");
//       return;
//     }
//     final FirebaseStorage storage = FirebaseStorage.instance;
//     for (var i = 0; i < _paths.length; i++) {
//       final File file = File(_paths[i]);
//       final  storageRef = storage.ref().child("images/${_paths[i]}");
//       try {
//         await storageRef.putFile(file);
        
//         print("Upload Successful");
//       } catch (e) {
//         print("Error Occured while uploading the image: $e");
//       }
//     } 

// }


}