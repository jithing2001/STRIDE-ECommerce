import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/controllers/quantity_controller.dart';
import 'package:ecommerce/model/cart_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CartService {
  final currentemail = FirebaseAuth.instance.currentUser!.email;
  QuantityController quantityController = Get.put(QuantityController());

  addCart({required CartModel product}) async {
    final cart = FirebaseFirestore.instance
        .collection('users')
        .doc('cart')
        .collection(currentemail!)
        .doc(product.productName);

    final json = product.toJson();
    quantityController.addTotal(int.parse(product.discountPrice));

    await cart.set(json);
  }

  Future<bool> checkcart({required CartModel product}) async {
    final cart = FirebaseFirestore.instance
        .collection('users')
        .doc('cart')
        .collection(currentemail!)
        .doc(product.productName);

    final snapshot = await cart.get();
    return snapshot.exists;
  }

  removeCart({required CartModel product}) async {
    final cart = FirebaseFirestore.instance
        .collection('users')
        .doc('cart')
        .collection(currentemail!)
        .doc(product.productName);

    quantityController.removeTotal(int.parse(product.discountPrice));

    await cart.delete();

    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }
    Get.snackbar('Success', 'Product removed from cart',
        animationDuration: const Duration(milliseconds: 100));
  }

  deleteWholeCart() async {
    final cartCollection = FirebaseFirestore.instance
        .collection('users')
        .doc('cart')
        .collection(currentemail!);

    final querySnapshot = await cartCollection.get();

    for (final doc in querySnapshot.docs) {
      await doc.reference.delete();
    }
  }
}
