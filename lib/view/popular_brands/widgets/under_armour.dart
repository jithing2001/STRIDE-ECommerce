import 'package:ecommerce/view/home/widgets/homegridview.dart';
import 'package:ecommerce/view/lists.dart';
import 'package:ecommerce/view/productdetail/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnderArmourClass extends StatelessWidget {
  const UnderArmourClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'UNDER ARMOUR',
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(240, 249, 247, 247),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.to(ProductDetailView(
                    imgPath: imagePath[index],
                    productDes: productDescription[index],
                    productNames: productName[index],
                        productRate: productRate[index]
                  ));
                },
                child: HomeGridView(
                    imgPath: imagePath[index],
                    productName: productName[index],
                    productRate: productRate[index]),
              );
            },
            itemCount: 4,
          ),
        ));
  }
}
