import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/view/home/widgets/homegridview.dart';
import 'package:ecommerce/view/productdetail/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class BrandWise extends StatelessWidget {
  String? title;
  BrandWise({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '$title',
            style: const TextStyle(fontSize: 25, color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(240, 249, 247, 247),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('myApp')
                  .doc('Admin')
                  .collection('products')
                  .where('productCategory', isEqualTo: title)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(ProductDetailView(
                          imgPath1: snapshot.data!.docs[index]['productImg1'],
                          imgPath2: snapshot.data!.docs[index]['productImg2'],
                          imgPath3: snapshot.data!.docs[index]['productImg3'],
                          productDes: snapshot.data!.docs[index]['productDes'],
                          productNames: snapshot.data!.docs[index]
                              ['productName'],
                          productRate: snapshot.data!.docs[index]
                              ['productPrice'],
                          sellingRate: snapshot.data!.docs[index]
                              ['discountPrice'],
                        ));
                      },
                      child: HomeGridView(
                          imgPath: snapshot.data!.docs[index]['productImg1'],
                          productName: snapshot.data!.docs[index]
                              ['productName'],
                          productRate: snapshot.data!.docs[index]
                              ['productPrice'],sellingRate: snapshot.data!.docs[index]['discountPrice']),

                    );
                  },
                  itemCount: snapshot.data!.docs.length,
                );
              }),
        ));
  }
}
