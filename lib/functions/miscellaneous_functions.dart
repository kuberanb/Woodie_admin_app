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
