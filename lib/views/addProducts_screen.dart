import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woodie_admin/controllers/addProductController.dart';
import 'package:woodie_admin/palettes/colorPalettes.dart';

class AddProducts extends StatelessWidget {
  const AddProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final productController = Get.put(AddProductController());
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(children: [
                Container(
                  height: 0.18 * screenHeight,
                  width: double.infinity,
                  color: kGreyColor,
                ),
                Positioned(
                  right: 18,
                  bottom: 18,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_circle_outline_rounded,
                      color: kListTileColor,
                      size: 50,
                    ),
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 0.02 * screenHeight,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: productController.availableQuantity,
                style: const TextStyle(color: kWhiteColor),
                decoration: InputDecoration(
                  fillColor: kListTileColor,
                  filled: true,
                  hintText: 'Available Quantity',
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
              ),
            ),
            const CustomDropDownButton(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(kListTileColor)),
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
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
              });
            }),
          ),
        ),
      ),
    );
  }
}
