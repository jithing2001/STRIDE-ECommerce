import 'package:ecommerce/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

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
        backgroundColor: kwhite,
        centerTitle: true,
        elevation: 1,
        title: const Text(
          'Add Address',
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kheight30,
          AddAdressFields(
            title: 'Full Name',
            hint: 'Enter Your Full Name',
          ),
          AddAdressFields(
            title: 'Local Area',
            hint: 'Enter local area',
          ),
          AddAdressFields(
            title: 'District',
            hint: 'Enter District',
          ),
          AddAdressFields(
            title: 'State',
            hint: 'Enter your State',
          ),
          AddAdressFields(
            title: 'Pincode',
            hint: 'Enter your Pincode',
          ),
          kheight20,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('Submit')),
            ],
          )
        ],
      ),
    );
  }
}

class AddAdressFields extends StatelessWidget {
  String? title;
  String? hint;
  AddAdressFields({super.key, required this.title, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title',
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          kheight5,
          TextFormField(
            decoration: InputDecoration(
                hintText: '$hint',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: kblack),
                    borderRadius: BorderRadius.circular(10))),
          )
        ],
      ),
    );
  }
}
