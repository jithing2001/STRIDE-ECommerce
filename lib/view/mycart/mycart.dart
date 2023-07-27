import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/controllers/quantity_controller.dart';
import 'package:ecommerce/model/cart_model.dart';
import 'package:ecommerce/service/cartservice.dart';
import 'package:ecommerce/view/checkout/checkout.dart';
import 'package:ecommerce/view/productdetail/product_detail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MyCart extends StatelessWidget {
  MyCart({Key? key}) : super(key: key);

  TotalController totalController = Get.put(TotalController());

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
                    totalController.total.value = 0;

                    return const Center(
                      child: Text('Cart is empty'),
                    );
                  }
                  totalController.priceList.clear();
                  totalController.total.value = 0;
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      List<CartModel> allCartModel = [];
                      allCartModel.addAll(snapshot.data!.docs.map((e) =>
                          CartModel.fromJson(
                              e.data() as Map<String, dynamic>)));
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () => Get.to(ProductDetailView(
                            imgPath1: allCartModel[index].productImg1,
                            imgPath2: allCartModel[index].productImg2,
                            imgPath3: allCartModel[index].productImg3,
                            productNames: allCartModel[index].productName,
                            productDes: allCartModel[index].productDes,
                            productRate: allCartModel[index].discountPrice,
                            sellingRate: allCartModel[index].discountPrice,
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
                                      '${allCartModel[index].productImg1}',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 30),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 210,
                                      child: Text(
                                        '${allCartModel[index].productName}',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
                                    Text(
                                      '₹${allCartModel[index].discountPrice}',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Size: ${allCartModel[index].productSize}',
                                      style: TextStyle(color: kblack),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () async {
                                    await CartService().removeCart(
                                        product: CartModel(
                                      productName:
                                          allCartModel[index].productName,
                                      productDes:
                                          allCartModel[index].productDes,
                                      productSize:
                                          allCartModel[index].productSize,
                                      discountPrice:
                                          allCartModel[index].discountPrice,
                                      productImg1:
                                          allCartModel[index].productImg1,
                                      productImg2:
                                          allCartModel[index].productImg2,
                                      productImg3:
                                          allCartModel[index].productImg3,
                                      currentUser:
                                          allCartModel[index].currentUser,
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
                totalList: totalController.priceList,
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
                      '₹$total',
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
              style: ElevatedButton.styleFrom(
                  backgroundColor: kwhite,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                log('$totalList');
                Get.to(Checkout(
                  total: total,
                ));
              },
              child: Text(
                'Checkout',
                style: TextStyle(color: kblack),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
