import 'package:ecommerce/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutDialogue extends StatelessWidget {
  const AboutDialogue({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
        color: kwhite,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.06,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: kblack),
            child: const Center(
              child: Text(
                'About',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ),
          // SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          kheight30,
          Text(
            'STRIDE',
            style: GoogleFonts.merriweather(color: kblack, fontSize: 30),
          ),
          kheight50,
          const Text(
            'App Designed and Developed by JITHIN',
            textAlign: TextAlign.center,
            style: TextStyle(
                height: 1.5, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          kheight50,
          const Text(
            "CONTACT",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          const Text("jithinkyd70@gmail.com")
        ],
      ),
    );
  }
}
