import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:woodie_admin/controllers/services/addProductController.dart';
import 'package:woodie_admin/core/constants.dart';
import 'package:woodie_admin/core/palettes/colorPalettes.dart';
import 'package:woodie_admin/functions/miscellaneous_functions.dart';
import 'package:woodie_admin/models/product_model.dart';

String? categoryValue = 'Sofa';
UploadTask? uploadTask;
// XFile? image;
List<XFile> imageArray = [];
List<XFile>? tempImageArrayList = [];
final picker = ImagePicker();
List<String> urlDownloadList = [];
bool isUpload = false;

class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final productController = Get.put(AddProductController());
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Text(
          'Add Products',
          style: TextStyle(color: kWhiteColor, fontSize: 22),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                    right: 0.04 * screenWidth,
                    left: 0.04 * screenWidth,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Select Images',
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 18,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await openGallery();
                        },
                        icon: const Icon(
                          Icons.add_circle_outline_rounded,
                          color: kWhiteColor,
                          size: 40,
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 0.02 * screenHeight,
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: 0.02 * screenWidth,
                  left: 0.02 * screenWidth,
                ),
                child: TextFormField(
                  controller: productController.titleController,
                  style: const TextStyle(color: kWhiteColor),
                  decoration: InputDecoration(
                    fillColor: kListTileColor,
                    filled: true,
                    hintText: 'Product Name',
                    hintStyle: const TextStyle(color: kWhiteColor),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: kBlackColor,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: kBlackColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: productController.priceController,
                  style: const TextStyle(color: kWhiteColor),
                  decoration: InputDecoration(
                    fillColor: kListTileColor,
                    filled: true,
                    hintText: 'Product Price',
                    hintStyle: const TextStyle(color: kWhiteColor),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: kBlackColor,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: kBlackColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter price';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: productController.availableQuantity,
                  style: const TextStyle(
                    color: kWhiteColor,
                  ),
                  decoration: InputDecoration(
                    fillColor: kListTileColor,
                    filled: true,
                    hintText: 'Available Quantity',
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
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: kBlackColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some quantity';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 5,
                  controller: productController.descriptionController,
                  style: const TextStyle(color: kWhiteColor),
                  decoration: InputDecoration(
                    fillColor: kListTileColor,
                    filled: true,
                    hintText: 'Description',
                    hintStyle: const TextStyle(color: kWhiteColor),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: kBlackColor,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: kBlackColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              const CustomDropDownButton(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 0.1 * screenWidth,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        if (formKey.currentState!.validate()) {
                          await uploadImagestoFirebase();
                          if (tempImageArrayList != null &&
                              tempImageArrayList!.isNotEmpty) {
                            await FirebaseFirestore.instance
                                .collection(productsCollection)
                                .doc()
                                .set(
                                  ProductModel(
                                    productCategory: categoryValue,
                                    productDescription: productController
                                        .descriptionController.text,
                                    productId: DateTime.now()
                                        .millisecondsSinceEpoch
                                        .toString(),
                                    productImages: urlDownloadList,
                                    productName:
                                        productController.titleController.text,
                                    productPrice: int.parse(
                                        productController.priceController.text),
                                  ).toJson(),
                                );

                            setState(() {
                              isUpload = false;
                            });
                            productController.titleController.clear();
                            productController.priceController.clear();
                            productController.availableQuantity.clear();
                            productController.descriptionController.clear();
                            urlDownloadList.clear();
                            imageArray.clear();
                            tempImageArrayList?.clear();
                            errorSnackBar(
                                'Product Data Added Sucessfully', context);
                          } else {
                            errorSnackBar('Select Images', context);
                            setState(() {
                              isUpload = false;
                            });
                          }
                        }
                      } catch (e) {
                        errorSnackBar(e.toString(), context);
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(kListTileColor),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(width: 0.1 * screenWidth),
                  (isUpload == true)
                      ? const CircularProgressIndicator(
                          color: kWhiteColor,
                          strokeWidth: 2,
                        )
                      : const SizedBox(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  openGallery() async {
    List<XFile?> image = await picker.pickMultiImage();
    if (image.isEmpty) {
      errorSnackBar('Image is not selected, select again', context);
    }
    if (image.isEmpty) {
      return;
    }
    for (var img in image) {
      imageArray.add(img!);
      tempImageArrayList!.add(img);
    }
    errorSnackBar('Image Selected Sucessfully', context);

    // setState(() {
    //   imageArray;
    // });
  }

  uploadImagestoFirebase() async {
    setState(() {
      isUpload = true;
    });
    if (imageArray.isEmpty) {
      imageArray = [];
    } else {
      for (var image in imageArray) {
        final path = 'images/${image.name}';
        final file = File(image.path);

        final ref =
            FirebaseStorage.instance.ref().child('products').child(path);
        // .putFile(file);

        uploadTask = ref.putFile(file);

        final snapshot = await uploadTask!.whenComplete(() {});
        final urlDownload = await snapshot.ref.getDownloadURL();
        log('Download Link: $urlDownload');
        urlDownloadList.add(urlDownload);
      }
      if (urlDownloadList.isNotEmpty) {
        errorSnackBar('Image uploaded Sucessfully', context);
      } else {
        // setState(() {
        //   isUpload = false;
        // });
        errorSnackBar('Image uploading is not sucessful,upload again', context);
      }
    }
  }
}

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({super.key});

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  String? selectedValue = 'Sofa';
  @override
  Widget build(BuildContext context) {
    final productController = Get.put(AddProductController());
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          // color: Colors.white,
          width: double.infinity,
          height: 35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: kListTileColor),
          child: DropdownButton(
            dropdownColor: Colors.black,
            // isExpanded: true,
            borderRadius: BorderRadius.circular(15),
            underline: Container(
                //height: 1,
                // color: kWhiteColor,
                ),
            hint: const Text(
              'Select Item',
              style: TextStyle(color: kWhiteColor, fontSize: 20),
            ),
            // disabledHint: const Text('Select Item',style: TextStyle(color: kBlackColor,fontSize: 22),),

            style: const TextStyle(color: kWhiteColor, fontSize: 20),
            value: selectedValue,
            items: productController.menuItems,
            onChanged: ((value) {
              setState(() {
                selectedValue = value;
                categoryValue = value;
              });
            }),
          ),
        ),
      ),
    );
  }
}
