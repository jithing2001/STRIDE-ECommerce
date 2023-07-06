import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/service/favorite_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  Favorites({super.key});
  final currentemail = FirebaseAuth.instance.currentUser!.email;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        backgroundColor: kwhite,
        elevation: 0,
        centerTitle: true,
        title: const Text('Favorites',
            style: TextStyle(fontSize: 25, color: Colors.black)),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(currentemail)
              .collection('favorites')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const CircularProgressIndicator();
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final favorite = snapshot.data!.docs[index].data();

                final product = ProductModel.fromJson(favorite);

                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 70,
                    width: double.infinity,
                    child: Row(
                      children: [
                        kwidth10,
                        Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                border: Border.all(color: kblack)),
                            child: Image(
                              image: NetworkImage(
                                  snapshot.data!.docs[index]['productImg']),
                              // fit: BoxFit.fill,
                            )),
                        kwidth40,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              snapshot.data!.docs[index]['productName'],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(snapshot.data!.docs[index]['discountPrice'],
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold))
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () async {
                              await FavoriteService()
                                  .removeFavorite(product: product);
                            },
                            icon: Icon(
                              Icons.favorite,
                              size: 30,
                              color: kred,
                            ))
                      ],
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
