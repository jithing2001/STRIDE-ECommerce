import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/model/fav_model.dart';
import 'package:ecommerce/service/favorite_service.dart';
import 'package:ecommerce/view/productdetail/product_detail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              .doc('favorites')
              .collection(currentemail!)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text(""),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final favorite = snapshot.data!.docs[index].data();
                final product = favModel.fromJson(favorite);
                List<favModel> allFavModel = [];
                allFavModel.addAll(snapshot.data!.docs.map((e) =>
                    favModel.fromJson(e.data() as Map<String, dynamic>)));

                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () => Get.to(ProductDetailView(
                        imgPath1: allFavModel[index].productImg1,
                        imgPath2: allFavModel[index].productImg2,
                        imgPath3: allFavModel[index].productImg3,
                        productNames: allFavModel[index].productName,
                        productDes: allFavModel[index].productDes,
                        productRate: allFavModel[index].productPrice,
                        sellingRate: allFavModel[index].discountPrice)),
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
                                image: NetworkImage(product.productImg1),
                              )),
                          kwidth40,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 200,
                                child: Text(
                                  product.productName,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text("₹${product.discountPrice}",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold))
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
                  ),
                );
              },
            );
          }),
    );
  }
}
