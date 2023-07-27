import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/product_model.dart';

class ProductServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ProductModel>> fetchProducts() async {
    try {
      final snapshot = await _firestore
          .collection('myApp')
          .doc('Admin')
          .collection('products')
          .get();

      List<ProductModel> products = snapshot.docs
          .map((e) => ProductModel.fromJson(e.data()))
          .toList();

      return products;
    } catch (e) {
      // Handle error if needed
      return [];
    }
  }
}