import 'package:flutter/material.dart';
import 'package:woodie_admin/core/palettes/colorPalettes.dart';

class EditProductDetails extends StatelessWidget {
  const EditProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Edit Product Details',
          style: TextStyle(color: kWhiteColor, fontSize: 22),
        ),
      ),
      body: const SingleChildScrollView(
        
      ),
    );
  }
}
