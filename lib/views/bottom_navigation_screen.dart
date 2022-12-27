import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woodie_admin/controllers/bottomNavigationController.dart';
import 'package:woodie_admin/palettes/colorPalettes.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavigationController());
    return Scaffold(
      body: Obx(
        (() => IndexedStack(
            index: controller.selectedValue.value, children: controller.pages)),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            onTap: ((value) {
              // controller.selectedValue = RxInt(value);
              controller.changeIndex(value);
            }),
            type: BottomNavigationBarType.fixed,
            
            backgroundColor: kBackgroundColor,
            selectedItemColor: kWhiteColor,
            unselectedItemColor: kBottomNavigationIconColor,
            currentIndex: controller.selectedValue.value,
            items: controller.bottomNavigationItems,
          )),
    );
  }
}
