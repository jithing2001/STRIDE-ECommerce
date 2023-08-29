import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/controllers/address_controller.dart';
import 'package:ecommerce/model/address_model.dart';
import 'package:ecommerce/view/add_address/add_address.dart';
import 'package:ecommerce/view/checkout/widgets/address_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

int selectedIndex = -1;

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  final currentemail = FirebaseAuth.instance.currentUser!.email;
  AddressController ad = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: kblack,
            )),
        elevation: 1,
        backgroundColor: kwhite,
        centerTitle: true,
        title: Text(
          'Shipping Adress',
          style: TextStyle(fontSize: 25, color: kblack),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc('address')
              .collection(currentemail!)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
            if (!snapshot.hasData || snapshot.data == null) {
              return const Center(
                child: Text('No address data available.'),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      ad.indexChanging(index);
                      Get.back();
                    },
                    child: snapshot.hasData
                        ? AddressCard(
                            index: index,
                            tappedIndex: AddressController().selectedIdx,
                            address: AddressModel(
                                name: snapshot.data!.docs[index]['name'],
                                area: snapshot.data!.docs[index]['area'],
                                district: snapshot.data!.docs[index]
                                    ['district'],
                                state: snapshot.data!.docs[index]['state'],
                                pincode: snapshot.data!.docs[index]['pincode']),
                          )
                        : const Center(
                            child: Text('loading...'),
                          ));
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: kblack,
          onPressed: () async {
            Get.to(AddAddress());
          },
          child: const Icon(Icons.add)),
    );
  }
}
