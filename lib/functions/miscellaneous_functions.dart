import "package:flutter/material.dart";
import 'package:woodie_admin/core/palettes/colorPalettes.dart';

errorSnackBar(String? text, BuildContext context) {
  if (text == null) return;

  final snackBar = SnackBar(
    // backgroundColor: kListTileColor,
    backgroundColor: kRedColor,
    margin: const EdgeInsets.all(20),
    behavior: SnackBarBehavior.floating,

    duration: const Duration(
      seconds: 2,
    ),
    content: Text(
      text,
      style: const TextStyle(
        color: kWhiteColor,
        fontSize: 18,
      ),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

showProductDeleteBottonSheet(
    {required BuildContext context,
    required screenHeight,
    required VoidCallback logOutFunction,
    required screenWidth}) {
  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: ((context) => Container(
          decoration: BoxDecoration(
            color: kListTileColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0.1 * screenHeight),
              topRight: Radius.circular(
                0.1 * screenWidth,
              ),
            ),
          ),
          width: screenWidth,
          height: 0.25 * screenHeight,
          child: Padding(
            padding: EdgeInsets.only(
              right: 0.05 * screenWidth,
              left: 0.05 * screenWidth,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 0.15 * screenWidth,
                      height: 0.01 * screenHeight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kspecialGrey,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                const Divider(
                  color: kspecialGrey,
                  thickness: 2,
                ),
                SizedBox(
                  height: 0.02 * screenHeight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Are you sure you want to delete product?',
                      style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.03 * screenHeight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 0.4 * screenWidth,
                        height: 0.06 * screenHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kspecialGrey,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Cancel',
                                style: TextStyle(
                                  color: kWhiteColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]),
                      ),
                    ),
                    InkWell(
                      onTap: logOutFunction,
                      child: Container(
                        width: 0.4 * screenWidth,
                        height: 0.06 * screenHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kWhiteColor,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Yes,Delete',
                                style: TextStyle(
                                  color: kBlackColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )),
  );
}
