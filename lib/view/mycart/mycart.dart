import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/controllers/cart_size_controller.dart';
import 'package:ecommerce/controllers/total_controller.dart';
import 'package:ecommerce/model/cart_model.dart';
import 'package:ecommerce/service/cartservice.dart';
import 'package:ecommerce/view/mycart/widgets/checkout_section.dart';
import 'package:ecommerce/view/mycart/widgets/size_edit_dialog.dart';
import 'package:ecommerce/view/productdetail/product_detail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MyCart extends StatelessWidget {
  MyCart({Key? key}) : super(key: key);

  TotalController totalController = Get.put(TotalController());
  // CartSizeController cartSizeController = Get.put(CartSizeController());

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

                      // Create a separate instance of CartSizeController for each product
                      final cartSizeController = CartSizeController(
                        initialSizeEdit:
                            int.parse(allCartModel[index].productSize!),
                      );

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
                                    kheight5,
                                    Row(
                                      children: [
                                        Text(
                                          'Size: ${cartSizeController.sizeEdit ?? allCartModel[index].productSize}',
                                          style: const TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () => Get.dialog(AlertDialog(
                                            content: SizeEdit(
                                              cartSizeController:
                                                  cartSizeController,
                                              product: allCartModel[index],
                                            ),
                                          )),
                                          child: const Icon(
                                            Icons.edit,
                                            size: 20,
                                          ),
                                        ),
                                      ],
                                    )
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
                                      ),
                                    );
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
              currentEmail: currentEmail,
            ),
          ],
        ),
      ),
    );
  }
}
