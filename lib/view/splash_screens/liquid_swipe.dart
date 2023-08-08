import 'package:ecommerce/constants.dart';
import 'package:ecommerce/view/user/login/userlogin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class LiquidSwipeClass extends StatelessWidget {
  LiquidSwipeClass({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body: LiquidSwipe(
      pages: pages,
      slideIconWidget: Icon(
        Icons.arrow_back_ios_rounded,
        size: 40,
        color: kwhite,
      ),
      positionSlideIcon: 0.5,
      // waveType: WaveType.liquidReveal,
      enableLoop: false,
      fullTransitionValue: 300,
      enableSideReveal: true,
    ));
  }

  final pages = [
    Stack(
      children: [
        const SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image(
              image: AssetImage(
                  'assets/images/Air Jordan 1 Retro High OG _Patina _ Rust Shadow_.jpeg'),
              fit: BoxFit.fitHeight,
            )),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            kheight550,
            Row(
              children: [
                kwidth30,
                const Text(
                  'Welcome to',
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
            Text(
              'STRIDE',
              style: GoogleFonts.merriweather(
                  fontSize: 45,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
          ],
        )
      ],
    ),
    Stack(
      children: [
        const SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image(
              image: AssetImage('assets/images/Nike Air Jordan IV.jpeg'),
              fit: BoxFit.fitHeight,
            )),
        Column(
          children: [
            kheight120,
            Row(
              children: [
                kwidth30,
                const Text(
                  'Walk with Confidence,\nStride with Style',
                  style: TextStyle(
                      fontSize: 37,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ],
        ),
      ],
    ),
    Stack(
      children: [
        const SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image(
              image: AssetImage('assets/images/Sweetsoles.jpeg'),
              fit: BoxFit.fitHeight,
            )),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            kheight650,
            Row(
              children: [
                kwidth10,
                const Text(
                  'Start Journey with',
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
            Text(
              'STRIDE',
              style: GoogleFonts.merriweather(
                  fontSize: 45,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
            ElevatedButton(
              onPressed: () {
                Get.off( UserLogin());
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(kblack)),
              child: const Text('Start your Journey'),
            )
          ],
        )
      ],
    ),
  ];
}
