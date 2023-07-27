import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/brand_model.dart';

class BrandServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<BrandModel>> fetchBrands() async {
    try {
      final snapshot = await _firestore
          .collection('myApp')
          .doc('Admin')
          .collection('Category')
          .get();
      log('function get');

      List<BrandModel> brands =
          snapshot.docs.map((e) => BrandModel.fromJson(e.data())).toList();
      log('return');
      return brands;
    } catch (e) {
      // Handle error if needed
      return [];
    }
  }
}
