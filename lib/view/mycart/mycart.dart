import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/controllers/quantity_controller.dart';
import 'package:ecommerce/view/checkout/checkout.dart';
import 'package:ecommerce/view/mycart/widgets/quantity_widgets.dart';
import 'package:ecommerce/view/productdetail/product_detail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCart extends StatelessWidget {
  MyCart({super.key});

  QuantityController quantityController = QuantityController();

  @override
  Widget build(BuildContext context) {
    final currentemail = FirebaseAuth.instance.currentUser!.email;

    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        backgroundColor: kwhite,
        centerTitle: true,
        elevation: 1,
        title: const Text(
          'My Cart',
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            SizedBox(
              height: 600,
              width: double.infinity,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(currentemail)
                      .collection('cart')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () => Get.to(ProductDetailView(
                              imgPath: snapshot.data!.docs[index]['productImg'],
                              productNames: snapshot.data!.docs[index]
                                  ['productName'],
                              productDes: snapshot.data!.docs[index]
                                  ['productDes'],
                              productRate: snapshot.data!.docs[index]
                                  ['productPrice'],
                              sellingRate: snapshot.data!.docs[index]
                                  ['discountPrice'],
                            
                            )),
                            child: Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: kblack)),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Image(
                                      image: NetworkImage(
                                          '${snapshot.data!.docs[index]['productImg']}'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  kwidth30,
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${snapshot.data!.docs[index]['productName']}',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                          '${int.parse(snapshot.data!.docs[index]['discountPrice']) * quantityController.count.value}',
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      kheight10,
                                      QuantityWidget()
                                    ],
                                  ),
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.delete))
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: kblack),
              height: 122,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: kwhite),
                      ),
                      kwidth30,
                      Text(
                        '₹11000',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: kwhite),
                      )
                    ],
                  ),
                  kheight10,
                  SizedBox(
                    height: 40,
                    width: 150,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(const Checkout());
                        },
                        child: const Text('Checkout')),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
