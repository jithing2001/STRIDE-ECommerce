import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';


class CartService {
    final currentemail = FirebaseAuth.instance.currentUser!.email;

  addCart({required ProductModel product}) async {

    final cart = FirebaseFirestore.instance
        .collection('users')
        .doc(currentemail)
        .collection('cart')
        .doc(product.productName);

    final json = product.toJson();

    await cart.set(json);
  }
}
