import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:woodie_admin/palettes/colorPalettes.dart';
import 'package:woodie_admin/views/edit_productDetails.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        title: const Text(
          'Products List',
          style: TextStyle(color: kWhiteColor, fontSize: 22),
        ),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: ((context, index) => ProductsListTile(
            productTitle: 'Sofa', productPrice: 5000, categoryName: 'Chair')),
      ),
    );
  }
}

class ProductsListTile extends StatelessWidget {
  String productTitle;
  int productPrice;
  String categoryName;
  ProductsListTile(
      {super.key,
      required this.productTitle,
      required this.productPrice,
      required this.categoryName});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: 0.11 * screenHeight,
          decoration: BoxDecoration(
            color: kListTileColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
              trailing: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const EditProductDetails()),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.edit_note,
                  color: kWhiteColor,
                  size: 35,
                ),
              ),
              leading: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkUMcNr5fCViBNjtVHJzweed6ViZ4BzRFLzw&usqp=CAU',
                errorBuilder: ((context, error, stackTrace) =>
                    Image.asset('assets/images/logo.jpeg')),
                fit: BoxFit.cover,
              ),
              title: Text(
                productTitle,
                style: const TextStyle(color: kWhiteColor, fontSize: 22),
              ),
              subtitle: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Price : ${productPrice.toString()}",
                    style: TextStyle(color: kWhiteColor),
                  ),
                  Text(
                    "Category Name : ${categoryName}",
                    style: const TextStyle(color: kWhiteColor),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
