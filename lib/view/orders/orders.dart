import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/model/order_model.dart';
import 'package:ecommerce/view/bottomnavigation.dart';
import 'package:ecommerce/view/orders/order_detail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final currentemail = FirebaseAuth.instance.currentUser!.email;

    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        title: const Text(
          'My Orders',
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: kwhite,
        leading: IconButton(
            onPressed: () {
              Get.to(BottomNavigationClass());
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: kblack,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc('myorder')
                .collection('allOrders')
                .where('user', isEqualTo: currentemail)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  List<OrderModel> allOrderModel = [];
                  allOrderModel.addAll(snapshot.data!.docs
                      .map((e) => OrderModel.fromJson(e.data())));
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: InkWell(
                      onTap: () => Get.to(
                          Order_Detail(order: allOrderModel[index])),
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: kblack)),
                        child: Row(
                          children: [
                            kwidth10,
                            SizedBox(
                              height: 60,
                              width: 60,
                              child: Image(
                                image: NetworkImage(
                                    allOrderModel[index].productImg1),
                                fit: BoxFit.fill,
                              ),
                            ),
                            kwidth30,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 230,
                                  child: Text(
                                    allOrderModel[index].productName,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(allOrderModel[index].deliveryStatus)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
