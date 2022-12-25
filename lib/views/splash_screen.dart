import 'package:flutter/material.dart';
import 'package:woodie_admin/palettes/colorPalettes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 0.03 * screenHeight,  
          ),
          const CircularProgressIndicator(
            color: kWhiteColor,
          ),
        ],
      ),
    );
  }
}
