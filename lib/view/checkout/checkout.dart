import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/controllers/address_controller.dart';
import 'package:ecommerce/model/order_model.dart';
import 'package:ecommerce/service/cartservice.dart';
import 'package:ecommerce/service/my_order_service.dart';
import 'package:ecommerce/view/checkout/widgets/payment_widgets.dart';
import 'package:ecommerce/view/checkout/widgets/shipping_address_widget.dart';
import 'package:ecommerce/view/checkout/widgets/shipping_addresses.dart';
import 'package:ecommerce/view/orders/orders.dart';
import 'package:ecommerce/view/payment/razorpay.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

String address = '';

class Checkout extends StatelessWidget {
  int? total;
  Checkout({super.key, required this.total});

  AddressController ad = Get.put(AddressController());
  OrderModel? ordery;

  @override
  Widget build(BuildContext context) {
    final currentemail = FirebaseAuth.instance.currentUser!.email;
    log('checking one :${AddressController().selectedIdx}');
    List<QueryDocumentSnapshot<Map<String, dynamic>>> tmp = [];
    ad.fetchAddresses();
    return Scaffold(
        backgroundColor: kwhite,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: kblack,
              )),
          backgroundColor: kwhite,
          centerTitle: true,
          elevation: 1,
          title: const Text(
            'Checkout',
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kheight30,
                const Text(
                  'Shipping Address',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                kheight10,
                Container(
                  height: 150,
                  width: 350,
                  decoration: BoxDecoration(
                      border: Border.all(color: kblack),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GetBuilder<AddressController>(
                          init: ad,
                          builder: (controller) {
                            log('checking one :${ad.selectedIdx}');
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                kheight10,
                                (ad.selectedIdx != null ||
                                        AddressController().selectedIdx != null)
                                    ? StreamBuilder(
                                        stream: FirebaseFirestore.instance
                                            .collection('users')
                                            .doc('address')
                                            .collection(currentemail!)
                                            .snapshots(),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData &&
                                              snapshot.data!.docs.isNotEmpty) {
                                            address = '';
                                            address =
                                                '${snapshot.data!.docs[ad.selectedIdx!]['name']},${snapshot.data!.docs[ad.selectedIdx!]['area']}${snapshot.data!.docs[ad.selectedIdx!]['district']},${snapshot.data!.docs[ad.selectedIdx!]['state']},${snapshot.data!.docs[ad.selectedIdx!]['pincode']}';
                                          }
                                          if (snapshot.data == null) {
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          } else if (snapshot.hasError) {
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          }
                                          return snapshot.hasData
                                              ? ShippingFields(
                                                  name: snapshot.data!
                                                          .docs[ad.selectedIdx!]
                                                      ['name'],
                                                  area: snapshot.data!
                                                          .docs[ad.selectedIdx!]
                                                      ['area'],
                                                  district: snapshot.data!
                                                          .docs[ad.selectedIdx!]
                                                      ['district'],
                                                  state: snapshot.data!
                                                          .docs[ad.selectedIdx!]
                                                      ['state'],
                                                  pincode: snapshot.data!
                                                          .docs[ad.selectedIdx!]
                                                      ['pincode'])
                                              : const Center(
                                                  child: Text('loading'),
                                                );
                                        })
                                    : const Center(
                                        child: Text('add address'),
                                      )
                              ],
                            );
                          }),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            Get.to(ShippingAddress());
                          },
                          icon: const Icon(
                            Icons.add_location_alt_rounded,
                            size: 30,
                          ))
                    ],
                  ),
                ),
                kheight10,
                const Text(
                  'Order List',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 290,
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .doc('cart')
                          .collection(currentemail!)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError &&
                            snapshot.data!.docs.isNotEmpty) {
                          return Text('Error: ${snapshot.error}');
                        }
                        tmp.addAll(snapshot.data!.docs);
                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(10),
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
                                        image: NetworkImage(snapshot
                                            .data!.docs[index]['image']),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    kwidth30,
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 210,
                                          child: Text(
                                            snapshot.data!.docs[index]
                                                ['productName'],
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Text(
                                            snapshot.data!.docs[index]['price'],
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                        kheight10,
                                        Text(
                                            "SIze: ${snapshot.data!.docs[index]['size']}"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }),
                ),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: kblack),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Select the Payment Method',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          kheight10,
                          InkWell(
                            onTap: () async {
                              final orderList = <OrderModel>[];
                              for (var x in tmp) {
                                ordery = OrderModel(
                                  productName: x['productName'],
                                  productDes: x['des'],
                                  productSize: x['size'],
                                  discountPrice: x['price'],
                                  productImg: x['image'],
                                  currentUser: x['user'],
                                  address: address,
                                  deliveryStatus: 'active',
                                );
                                orderList.add(ordery!);

                                await Razor(order: ordery!).pay();
                                for (var order in orderList) {
                                  await MyOrderService().addOrder(order);
                                }
                              }
                            },
                            child: PaymentsWidgets(
                                imgPath: 'assets/images/razor_pay_icon.png',
                                payments: 'Razorpay'),
                          ),
                          kheight20,
                          InkWell(
                            onTap: () async {
                              for (var x in tmp) {
                                ordery = OrderModel(
                                  productName: x['productName'],
                                  productDes: x['des'],
                                  productSize: x['size'],
                                  discountPrice: x['price'],
                                  productImg: x['image'],
                                  currentUser: x['user'],
                                  address: address,
                                  deliveryStatus: 'active',
                                );
                                await MyOrderService().addOrder(ordery!);
                              }

                              await CartService().deleteWholeCart();

                              Get.to(const MyOrders());
                            },
                            child: PaymentsWidgets(
                                imgPath: 'assets/images/pngwing.com (7).png',
                                payments: 'Cash on Delivery'),
                          ),
                          kheight5,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Total',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              kwidth30,
                              Text(
                                '$total',
                                style: TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                    color: kblue),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
