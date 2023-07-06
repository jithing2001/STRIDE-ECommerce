import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/view/home/widgets/homegridview.dart';
import 'package:ecommerce/view/popular_brands/popularbrands.dart';
import 'package:ecommerce/view/popular_brands/widgets/brand_wise.dart';
import 'package:ecommerce/view/productdetail/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce/view/settings/settings.dart';

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
                  Get.to(const SettingsClass());
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

              SizedBox(
                height: 70,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('myApp')
                        .doc('Admin')
                        .collection('Category')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.data == null) {
                        return const CircularProgressIndicator();
                      }
                      return ListView.separated(
                        separatorBuilder: (context, index) => kwidth10,
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () => Get.to(BrandWise(
                                title: snapshot.data!.docs[index]['category'])),
                            child: PopularBrands(
                              imgpath: snapshot.data!.docs[index]['image'],
                              brandName: snapshot.data!.docs[index]['category'],
                            ),
                          );
                        },
                      );
                    }),
              ),
              //   ],
              // ),
              kheight30,
              Expanded(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('myApp')
                          .doc('Admin')
                          .collection('products')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.to(ProductDetailView(
                                  imgPath: snapshot.data!.docs[index]
                                      ['productImg'],
                                  productNames: snapshot.data!.docs[index]
                                      ['productName'],
                                  productDes: snapshot.data!.docs[index]
                                      ['productDes'],
                                  productRate: snapshot.data!.docs[index]
                                      ['productPrice'],
                                  sellingRate: snapshot.data!.docs[index]
                                      ['discountPrice'],
                                ));
                                log(index.toString());
                              },
                              child: HomeGridView(
                                imgPath: snapshot.data!.docs[index]
                                    ['productImg'],
                                productName: snapshot.data!.docs[index]
                                    ['productName'],
                                productRate: snapshot.data!.docs[index]
                                    ['discountPrice'],
                              ),
                            );
                          },
                          itemCount: snapshot.data!.docs.length,
                        );
                      }))
            ],
          ),
        ));
  }
}
