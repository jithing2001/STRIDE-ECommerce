import 'package:ecommerce/constants.dart';
import 'package:ecommerce/view/add_address/add_address.dart';
import 'package:ecommerce/view/checkout/widgets/address_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShippingAddress extends StatelessWidget {
  ShippingAddress({super.key});

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
      body: ListView(
        children: [
          AddressCard(icon: Icons.radio_button_checked),
          AddressCard(
            icon: Icons.radio_button_unchecked,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(const AddAddress());
          },
          child: const Icon(Icons.add)),
    );
  }
}
