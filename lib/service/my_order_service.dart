import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/order_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyOrderService {
  final currentemail = FirebaseAuth.instance.currentUser!.email;

  addOrder(OrderModel order) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc('myorder')
          .collection(currentemail!)
          .doc(order.productName)
          .set(order.toJson());
    } catch (e) {
      log('Error adding order: $e');
    }
  }
}
