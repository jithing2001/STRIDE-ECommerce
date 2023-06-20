import 'dart:developer';

import 'package:ecommerce/constants.dart';
import 'package:ecommerce/view/home/widgets/homegridview.dart';
import 'package:ecommerce/view/lists.dart';
import 'package:ecommerce/view/popular_brands/popularbrands.dart';
import 'package:ecommerce/view/popular_brands/widgets/adidas.dart';
import 'package:ecommerce/view/popular_brands/widgets/converse.dart';
import 'package:ecommerce/view/popular_brands/widgets/nike.dart';
import 'package:ecommerce/view/popular_brands/widgets/puma.dart';
import 'package:ecommerce/view/popular_brands/widgets/reebok.dart';
import 'package:ecommerce/view/popular_brands/widgets/under_armour.dart';
import 'package:ecommerce/view/productdetail/product_detail.dart';
import 'package:ecommerce/view/settings/settings.dart';
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
                onPressed: () {
                  Get.to(const Settings());
                },
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
                      builder: (context) => const NikeClass(),
                    )),
                    child: PopularBrands(
                      imgpath: 'assets/images/nike-256.png',
                    ),
                  ),
                  kwidth10,
                  InkWell(
                    onTap: () => Get.to(const AdidasClass()),
                    child: PopularBrands(
                        imgpath:
                            'assets/images/Adidas-White-Logo-PNG-Clipart-Background.png'),
                  ),
                  kwidth10,
                  InkWell(
                    onTap: () => Get.to(const PumaClass()),
                    child: PopularBrands(
                        imgpath: 'assets/images/puma-logo-png-21175.png'),
                  ),
                  kwidth10,
                  InkWell(
                      onTap: () => Get.to(const ReebokClass()),
                      child: PopularBrands(
                          imgpath: 'assets/images/PngItem_1900489.png')),
                  kwidth10,
                  InkWell(
                    onTap: () => Get.to(const UnderArmourClass()),
                    child: PopularBrands(
                        imgpath: 'assets/images/pngaaa.com-3430149.png'),
                  ),
                  kwidth10,
                  InkWell(
                    onTap: () => Get.to(const ConverseClass()),
                    child: PopularBrands(
                        imgpath:
                            'assets/images/pngwing.com__8_-removebg-preview.png'),
                  )
                ],
              ),
              kheight30,
              Expanded(
                  child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(ProductDetailView(
                        imgPath: imagePath[index],
                        productNames: productName[index],
                        productDes: productDescription[index],
                        productRate: productRate[index],
                      ));
                      log(index.toString());
                    },
                    child: HomeGridView(
                        imgPath: imagePath[index],
                        productName: productName[index],
                        productRate: productRate[index]),
                  );
                },
                itemCount: 10,
              ))
            ],
          ),
        ));
  }
}
