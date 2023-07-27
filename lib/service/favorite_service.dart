import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/fav_model.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FavoriteService {
  final currentemail = FirebaseAuth.instance.currentUser!.email;

  addFavorite({required favModel product}) async {
    final favorite = FirebaseFirestore.instance
        .collection('users')
        .doc('favorites')
        .collection(currentemail!)
        .doc(product.productName);

    final json = product.toJson();

    await favorite.set(json);

    Get.snackbar('success', 'added');
  }

  Future<bool> checkFav({required favModel product}) async {
    final favorite = FirebaseFirestore.instance
        .collection('users')
        .doc('favorites')
        .collection(currentemail!)
        .doc(product.productName);

    final snapshot = await favorite.get();
    return snapshot.exists;
  }

  removeFavorite({required favModel product}) async {
    // print(product.productName);
    final favorite = FirebaseFirestore.instance
        .collection('users')
        .doc('favorites')
        .collection(currentemail!)
        .doc(product.productName);

    await favorite.delete();
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }
    Get.snackbar('Success', 'Product removed from favorites',
        animationDuration: const Duration(milliseconds: 100));
  }
}
