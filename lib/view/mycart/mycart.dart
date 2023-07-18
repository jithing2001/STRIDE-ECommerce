import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/controllers/quantity_controller.dart';
import 'package:ecommerce/model/cart_model.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/service/cartservice.dart';
import 'package:ecommerce/view/checkout/checkout.dart';
import 'package:ecommerce/view/productdetail/product_detail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MyCart extends StatelessWidget {
  MyCart({Key? key}) : super(key: key);

  QuantityController quantityController = Get.put(QuantityController());

  @override
  Widget build(BuildContext context) {
    final currentEmail = FirebaseAuth.instance.currentUser!.email;

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
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc('cart')
                    .collection(currentEmail!)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                    // Update the total value in the controller
                    quantityController.total.value = 0;

                    return const Center(
                      child: Text('Cart is empty'),
                    );
                  }
                  quantityController.priceList.clear();
                  quantityController.total.value = 0;
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      // quantityController.addTotal(
                      //     int.parse(snapshot.data!.docs[index]['price']));
                      quantityController.priceList
                          .add(int.parse(snapshot.data!.docs[index]['price']));
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () => Get.to(ProductDetailView(
                            imgPath: snapshot.data!.docs[index]['image'],
                            productNames: snapshot.data!.docs[index]
                                ['productName'],
                            productDes: snapshot.data!.docs[index]['des'],
                            productRate: snapshot.data!.docs[index]['price'],
                            sellingRate: snapshot.data!.docs[index]['price'],
                          )),
                          child: Container(
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: kblack),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image(
                                    image: NetworkImage(
                                      '${snapshot.data!.docs[index]['image']}',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 30),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 210,
                                      child: Text(
                                        '${snapshot.data!.docs[index]['productName']}',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
                                    Text(
                                      '₹${snapshot.data!.docs[index]['price']}',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Size: ${snapshot.data!.docs[index]['size']}',
                                      style: TextStyle(color: kblack),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () async {
                                    await CartService().removeCart(
                                        product: CartModel(
                                      productName: snapshot.data!.docs[index]
                                          ['productName'],
                                      productDes: snapshot.data!.docs[index]
                                          ['des'],
                                      productSize: snapshot.data!.docs[index]
                                          ['size'],
                                      discountPrice: snapshot.data!.docs[index]
                                          ['price'],
                                      productImg: snapshot.data!.docs[index]
                                          ['image'],
                                      currentUser: snapshot.data!.docs[index]
                                          ['user'],
                                    ));
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            CheckoutSection(
                totalList: quantityController.priceList,
                currentEmail: currentEmail),
          ],
        ),
      ),
    );
  }
}

class CheckoutSection extends StatelessWidget {
  const CheckoutSection({
    super.key,
    required this.totalList,
    required this.currentEmail,
  });
  final List<int> totalList;
  final String currentEmail;
  @override
  Widget build(BuildContext context) {
    int total = 0;

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: kblack,
      ),
      height: 122,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total  ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kwhite,
                ),
              ),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc('cart')
                      .collection(currentEmail)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData &&
                        snapshot.data!.docs.isEmpty) {
                      // Update the total value in the controller
                      //  quantityController.total.value = 0;

                      return const Center(
                        child: Text(''),
                      );
                    }
                    total = 0;
                    for (var x in snapshot.data!.docs) {
                      total = total + int.parse(x['price']);
                    }

                    return Text(
                      '$total',
                      // "${quantityController.total.value}",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: kwhite,
                      ),
                    );
                  }),
              const SizedBox(width: 30),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 40,
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                log('${totalList}');
                Get.to(Checkout(
                  total: total,
                ));
              },
              child: const Text('Checkout'),
            ),
          ),
        ],
      ),
    );
  }
}
