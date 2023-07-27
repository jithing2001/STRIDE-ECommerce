import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:get/get.dart';

class SearchControllers extends GetxController {
  RxList<ProductModel> data = RxList<ProductModel>();

  search(String searchText) async {
    var querySnapshot = await FirebaseFirestore.instance
        .collection('myApp')
        .doc('Admin')
        .collection('products')
        .where('productName', isGreaterThanOrEqualTo: searchText)
        .where('productName', isLessThan: '${searchText}z')
        .get();
    log(querySnapshot.toString());
    log('Query result: ${querySnapshot.docs.length} documents found');
    data.value = querySnapshot.docs
        .map((doc) => ProductModel.fromJson(doc.data()))
        .toList();
    update();
    log(data.length.toString());
  }
}
