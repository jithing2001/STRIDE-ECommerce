import 'package:ecommerce/constants.dart';
import 'package:ecommerce/view/bottomnavigation.dart';
import 'package:ecommerce/view/splash_screens/liquid_swipe.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashOne extends StatelessWidget {
  const SplashOne({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 1));
      final userLogin = FirebaseAuth.instance.currentUser;
      if (userLogin == null) {
        Get.off(LiquidSwipeClass());
      } else {
        Get.off(BottomNavigationClass());
      }
    });
    return Scaffold(
        backgroundColor: kblue,
        body: Stack(
          children: [
            const SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image(
                image: AssetImage('assets/images/download (1).jpeg'),
                fit: BoxFit.fitHeight,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                kheight450,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'STRIDE',
                      style: GoogleFonts.merriweather(
                          fontSize: 45,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                CircularProgressIndicator(
                  color: kwhite,
                )
              ],
            )
          ],
        ));
  }
}
