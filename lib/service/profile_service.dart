import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileService {
  final user = FirebaseAuth.instance.currentUser;

  

  editProfile({required String name, required String number}) async {
    await FirebaseFirestore.instance
        .collection('user_details')
        .doc(user!.uid)
        .update({
      'name': name,
      'phone Number': number,
    });
  }
}
