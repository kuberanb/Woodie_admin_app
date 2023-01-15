import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woodie_admin/controllers/loginScreenController.dart';
import 'package:woodie_admin/core/palettes/colorPalettes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginScreenController());
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 0.01 * screenHeight,
            ),
            Center(
              child: SizedBox(
                width: 0.5 * screenWidth,
                height: 0.3 * screenHeight,
                child: Image.asset('assets/images/logo.jpeg'),
              ),
            ),
            SizedBox(
              height: 0.01 * screenHeight,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller.emailController,
                style: const TextStyle(color: kWhiteColor),
                decoration: InputDecoration(
                  fillColor: kListTileColor,
                  filled: true,
                  hintText: 'Email',
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
                controller: controller.passwordController,
                style: const TextStyle(color: kWhiteColor),
                decoration: InputDecoration(
                  fillColor: kListTileColor,
                  filled: true,
                  hintText: 'Password',
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
            SizedBox(
              height: 0.01 * screenHeight,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(kListTileColor),
              ),
              child: const Text( 
                'Login',
                style: TextStyle(fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
