import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/controllers/total_controller.dart';
import 'package:ecommerce/model/cart_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CartService {
  final currentemail = FirebaseAuth.instance.currentUser!.email;
  TotalController totalController = Get.put(TotalController());

  addCart({required CartModel product}) async {
    final cart = FirebaseFirestore.instance
        .collection('users')
        .doc('cart')
        .collection(currentemail!)
        .doc(product.productName);

    final json = product.toJson();
    totalController.addTotal(int.parse(product.discountPrice));

    await cart.set(json);
    Get.snackbar('Success', 'Product added to cart');
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

    totalController.removeTotal(int.parse(product.discountPrice));

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

  editProductSize({required CartModel product, required int size}) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc('cart')
        .collection(currentemail!)
        .doc(product.productName)
        .update({'size': size.toString()});
  }
}
