import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/address_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AddressServices {
  final currentemail = FirebaseAuth.instance.currentUser!.email;

  addAddress({required AddressModel address}) async {
    final addressFirebaseVariable = FirebaseFirestore.instance
        .collection('users')
        .doc('address')
        .collection(currentemail!)
        .doc(address.area);

    final json = address.toJson();

    await addressFirebaseVariable.set(json);
  }

  removeAddress({required AddressModel address}) async {
    final addressFirebaseVariable = FirebaseFirestore.instance
        .collection('users')
        .doc('address')
        .collection(currentemail!)
        .doc(address.area);

    await addressFirebaseVariable.delete();

    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }
    Get.snackbar('Success', 'Address Removed from Address List',
        animationDuration: const Duration(milliseconds: 100));
  }

  getAddess() async {
    FirebaseFirestore.instance
        .collection('users')
        .doc('address')
        .collection(currentemail!)
        .snapshots();
  }
}
