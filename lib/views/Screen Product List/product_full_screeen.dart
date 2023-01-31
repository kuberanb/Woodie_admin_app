import 'package:flutter/material.dart';
import 'package:woodie_admin/core/palettes/colorPalettes.dart';

class SelectedProductFullScreen extends StatelessWidget {
  String productName;
  int productPrice;
  String productDescription;
  List<dynamic> productImageList;
  SelectedProductFullScreen({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.productImageList,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    // int productQuantity = 1;
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return true;
      },
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          title: Text(
            // 'Double Bed',
            productName,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: kWhiteColor,
            ),
          ),
          backgroundColor: kBackgroundColor,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: kWhiteColor,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              right: 0.03 * screenWidth,
              left: 0.03 * screenWidth,
              top: 0.01 * screenHeight,
              // bottom: 0.01 * screenHeight,
            ),
            child: Column(
              children: [
                ProductFullScreenImages(
                  imageUrlList: productImageList,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 0.03 * screenHeight,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          // 'Century Double Bed',
                          productName,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: kWhiteColor,
                            fontSize: 22,
                          ),
                        ),
                        // IconButton(
                        //   onPressed: () {},
                        //   icon: const Icon(
                        //     Icons.favorite_outline_outlined,
                        //     color: kWhiteColor,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: const [
                //     Icon(
                //       Icons.star_rounded,
                //       color: kLightGreyColor,
                //     ),
                //     Text(
                //       '4.8 (6,578 review)',
                //       style: TextStyle(color: kLightWhiteColor),
                //     )
                //   ],
                // ),
                const Divider(
                  thickness: 1,
                  color: kLightGreyColor,
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Description',
                      style: TextStyle(color: kWhiteColor, fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.01 * screenHeight,
                ),
                Text(
                  productDescription,
                  style: const TextStyle(
                    color: kExtraLightWhiteColor,
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 0.03 * screenHeight,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductFullScreenImages extends StatelessWidget {
  List<dynamic> imageUrlList;
  ProductFullScreenImages({super.key, required this.imageUrlList});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 0.42 * screenHeight,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) => ProductFullScreenSingleImage(
              imageUrl: imageUrlList[index],
            )),
        itemCount: imageUrlList.length,
      ),
    );
  }
}

class ProductFullScreenSingleImage extends StatelessWidget {
  String imageUrl;
  ProductFullScreenSingleImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
        right: 0.01 * screenWidth,
        left: 0.01 * screenWidth,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 0.9 * screenWidth,
            height: 0.4 * screenHeight,
            decoration: BoxDecoration(
              color: kListTileColor,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  // 'https://www.ulcdn.net/images/products/149916/slide/666x363/0.jpg?1548906914'
                  imageUrl,
                ),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
          ),

          // SizedBox(
          //   height: 0.01 * screenHeight,
          // ),
          // const Text(
          //   'Form Cushioned Sofa',
          //   style: TextStyle(
          //       color: kWhiteColor,
          //       fontSize: 18,
          //       overflow: TextOverflow.ellipsis),
          // ),
          // SizedBox(
          //   height: 0.01 * screenHeight,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     SizedBox(
          //       width: 0.05 * screenWidth,
          //     ),
          //     const Text(
          //       '₹ 25,000',
          //       style: TextStyle(
          //         color: kLightWhiteColor,
          //         fontSize: 16,
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
