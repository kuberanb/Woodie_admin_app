import 'package:flutter/material.dart';
import 'package:woodie_admin/core/palettes/colorPalettes.dart';
import 'package:woodie_admin/views/Screen%20Add%20Products/addProducts_screen.dart';
import 'package:woodie_admin/views/Screen%20Navigation/bottom_navigation_screen.dart';
import 'package:woodie_admin/views/login_screen.dart';
import 'package:woodie_admin/views/Screen%20Orders/order_status.dart';
import 'package:woodie_admin/views/Screen%20Orders/orders_screen.dart';
import 'package:woodie_admin/views/Screen%20Product%20List/productsList_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    gotoScreen(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.jpeg',
                  width: 60,
                  height: 140,
                ),
                SizedBox(
                  height: 0.2 * screenWidth,
                ),
                const Text(
                  'Woodie',
                  style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 0.03 * screenHeight,
          ),
          const CircularProgressIndicator(
            color: kWhiteColor,
            strokeWidth: 3,
          ),
        ],
      ),
    );
  }

  Future<void> gotoScreen(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 1500));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: ((context) => const NavigationScreen()),
      ),
    );
  }
}
