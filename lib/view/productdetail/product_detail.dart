import 'package:ecommerce/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/productsize.dart';

class ProductDetailView extends StatelessWidget {
  String? imgPath;
  String? productNames;
  String? productDes;
  String? productRate;
  ProductDetailView(
      {super.key,
      required this.imgPath,
      required this.productNames,
      required this.productDes,
      required this.productRate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        backgroundColor: kwhite,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: kblack,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                color: kblack,
                size: 30,
              ))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kheight170,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('$imgPath'),
              ),
            ],
          ),
          kheight20,
          Row(
            children: [
              kwidth50,
              Text(
                '$productNames',
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              kwidth50,
              Text(
                '$productRate',
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          kheight20,
          Center(child: Text('$productDes')),
          kheight30,
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              'Size',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          kheight10,
          Row(
            children: [
              kwidth30,
              ProductSize(
                size: '8',
              ),
              kwidth10,
              ProductSize(size: '9'),
              kwidth10,
              ProductSize(size: '10'),
              kwidth10,
              ProductSize(size: '11')
            ],
          ),
          kheight30,
          Center(
            child: SizedBox(
              height: 50,
              width: 200,
              child:
                  ElevatedButton(onPressed: () {}, child: const Text('Add to Cart')),
            ),
          )
        ],
      ),
    );
  }
}
