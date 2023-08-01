import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/view/checkout/checkout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
