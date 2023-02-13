import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woodie_admin/controllers/product_list_controller.dart';
import 'package:woodie_admin/core/constants.dart';
import 'package:woodie_admin/core/palettes/colorPalettes.dart';
import 'package:woodie_admin/functions/miscellaneous_functions.dart';
import 'package:woodie_admin/views/Screen%20Product%20List/product_full_screeen.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductListController());
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        title: const Text(
          'Products List',
          style: TextStyle(color: kWhiteColor, fontSize: 22),
        ),
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
        stream: controller.getHomeProducts(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: kWhiteColor,
              ),
            );
          } else if (snapshot.hasData) {
            if (snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text(
                  'No Products is Added',
                  style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 20,
                  ),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: ((context, index) => ProductsListTile(
                      productTitle: snapshot.data?.docs[index]['productName'],
                      productPrice: snapshot.data?.docs[index]['productPrice'],
                      categoryName: snapshot.data?.docs[index]
                          ['productCategory'],
                      imageUrl:
                          // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkUMcNr5fCViBNjtVHJzweed6ViZ4BzRFLzw&usqp=CAU'
                          snapshot.data?.docs[index]['productImages'][0],
                      productFullScreenFunc: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) => SelectedProductFullScreen(
                                  productName: snapshot.data?.docs[index]
                                      ['productName'],
                                  productPrice: snapshot.data?.docs[index]
                                      ['productPrice'],
                                  productDescription: snapshot.data?.docs[index]
                                      ['productDescription'],
                                  productImageList: snapshot.data?.docs[index]
                                      ['productImages'],
                                )),
                          ),
                        );
                      },
                      productDeleteFunc: () {
                        showProductDeleteBottonSheet(
                            context: context,
                            screenHeight: screenHeight,
                            logOutFunction: () async {
                              try {
                                var docId = snapshot.data?.docs[index].id;
                                await FirebaseFirestore.instance
                                    .collection(productsCollection)
                                    .doc(docId)
                                    .delete();
                                Navigator.of(context).pop();
                                errorSnackBar(
                                    'Product Deleted Sucessfully', context);
                              } catch (e) {
                                errorSnackBar(e.toString(), context);
                              }
                            },
                            screenWidth: screenWidth);
                      },
                    )),
              );
            }
          } else {
            return const Center(
              child: Text(
                'Something Went Wrong',
                style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 20,
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}

class ProductsListTile extends StatelessWidget {
  String productTitle;
  int productPrice;
  String categoryName;
  String imageUrl;
  VoidCallback productFullScreenFunc;
  VoidCallback productDeleteFunc;
  ProductsListTile({
    super.key,
    required this.productTitle,
    required this.productPrice,
    required this.categoryName,
    required this.imageUrl,
    required this.productFullScreenFunc,
    required this.productDeleteFunc,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: productFullScreenFunc,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: 0.1 * screenHeight,
          decoration: BoxDecoration(
            color: kListTileColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
              trailing: IconButton(
                onPressed: productDeleteFunc,

                // () {
                //   // Navigator.of(context).push(
                //   //   MaterialPageRoute(
                //   //     builder: ((context) => const EditProductDetails()),
                //   //   ),
                //   // );
                // },
                icon: const Icon(
                  Icons.delete,
                  color: kWhiteColor,
                  size: 25,
                ),
              ),
              leading: Container(
                height: 0.3 * screenHeight,
                width: 0.25 * screenWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),

                // child:

                // Image.network(
                //   imageUrl,
                //   errorBuilder: ((context, error, stackTrace) =>
                //       Image.asset('assets/images/logo.jpeg')),
                //   fit: BoxFit.cover,
                // ),
              ),
              title: Text(
                productTitle,
                maxLines: 1,
                style: const TextStyle(
                  color: kWhiteColor,
                  fontSize: 22,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              subtitle: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Price : ${productPrice.toString()}",
                    maxLines: 1,
                    style: const TextStyle(
                      color: kWhiteColor,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    // ignore: unnecessary_brace_in_string_interps
                    "Category Name : ${categoryName}",
                    maxLines: 1,
                    style: const TextStyle(
                      color: kWhiteColor,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
