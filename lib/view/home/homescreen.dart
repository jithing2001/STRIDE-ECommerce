import 'package:ecommerce/constants.dart';
import 'package:ecommerce/view/home/widgets/homegridview.dart';
import 'package:ecommerce/view/popular_brands/popularbrands.dart';
import 'package:ecommerce/view/popular_brands/widgets/adidas.dart';
import 'package:ecommerce/view/popular_brands/widgets/converse.dart';
import 'package:ecommerce/view/popular_brands/widgets/nike.dart';
import 'package:ecommerce/view/popular_brands/widgets/puma.dart';
import 'package:ecommerce/view/popular_brands/widgets/reebok.dart';
import 'package:ecommerce/view/popular_brands/widgets/under_armour.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(240, 249, 247, 247),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'STRIDE',
            style: GoogleFonts.merriweather(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.w400),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings,
                  color: Colors.black,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kheight10,
              const Text(
                'Discover the Best..',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              kheight10,
              SizedBox(
                height: 50,
                width: 350,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Looking for Shoes',
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              kheight10,
              const Text(
                'Popular Brands',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              kheight10,
              Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NikeClass(),
                    )),
                    child: PopularBrands(
                      imgpath: 'assets/images/nike-256.png',
                    ),
                  ),
                  kwidth10,
                  InkWell(
                    onTap: () => Get.to(AdidasClass()),
                    child: PopularBrands(
                        imgpath:
                            'assets/images/Adidas-White-Logo-PNG-Clipart-Background.png'),
                  ),
                  kwidth10,
                  InkWell(
                    onTap: () => Get.to(PumaClass()),
                    child: PopularBrands(
                        imgpath: 'assets/images/puma-logo-png-21175.png'),
                  ),
                  kwidth10,
                  InkWell(
                      onTap: () => Get.to(ReebokClass()),
                      child: PopularBrands(
                          imgpath: 'assets/images/PngItem_1900489.png')),
                  kwidth10,
                  InkWell(
                    onTap: () => Get.to(UnderArmourClass()),
                    child: PopularBrands(
                        imgpath: 'assets/images/pngaaa.com-3430149.png'),
                  ),
                  kwidth10,
                  InkWell(
                    onTap: () => Get.to(ConverseClass()),
                    child: PopularBrands(
                        imgpath:
                            'assets/images/pngwing.com__8_-removebg-preview.png'),
                  )
                ],
              ),
              kheight30,
              Expanded(
                  child: GridView.count(
                padding: const EdgeInsets.all(10),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: [
                  HomeGridView(
                      imgPath: 'assets/images/images (1).png',
                      productName: 'Adidas Bouncer\n₹1200'),
                  HomeGridView(
                      imgPath: 'assets/images/adidas evolve.png',
                      productName: 'Adidas Evolve Run\n₹1600'),
                  HomeGridView(
                      imgPath: 'assets/images/puma pacer.png',
                      productName: 'Puma Pacer Prime\n1400'),
                  HomeGridView(
                      imgPath: 'assets/images/puma laceup.png',
                      productName: 'Puma Lace_Up\n₹1300')
                ],
              ))
            ],
          ),
        ));
  }
}
