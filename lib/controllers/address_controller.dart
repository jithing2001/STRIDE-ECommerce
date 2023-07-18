import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  int? selectedIdx ;
  final currentEmail = FirebaseAuth.instance.currentUser!.email;
  List addressList = [];

  indexChanging(int index) {
    selectedIdx = index;

    update();
  }

  fetchAddresses() {
    FirebaseFirestore.instance
        .collection('users')
        .doc('address')
        .collection(currentEmail!)
        .get()
        .then((snapshot) {
      addressList = snapshot.docs.map((doc) => doc['address']).toList();
      update();
    }).catchError((error) {
      print('Error fetching addresses: $error');
    });
  }
}
