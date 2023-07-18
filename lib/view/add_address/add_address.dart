
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/model/address_model.dart';
import 'package:ecommerce/service/address_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  AddAddress({super.key});

  TextEditingController nameController = TextEditingController();

  TextEditingController areaController = TextEditingController();

  TextEditingController districtController = TextEditingController();

  TextEditingController stateController = TextEditingController();

  TextEditingController pincodeController = TextEditingController();
  final formkey = GlobalKey<FormState>();

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
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kheight30,
              AddAdressFields(
                title: 'Full Name',
                hint: 'Enter Your Full Name',
                controller: nameController,
              ),
              AddAdressFields(
                title: 'Local Area',
                hint: 'Enter local area',
                controller: areaController,
              ),
              AddAdressFields(
                title: 'District',
                hint: 'Enter District',
                controller: districtController,
              ),
              AddAdressFields(
                title: 'State',
                hint: 'Enter your State',
                controller: stateController,
              ),
              AddAdressFields(
                title: 'Pincode',
                hint: 'Enter your Pincode',
                controller: pincodeController,
              ),
              kheight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          await AddressServices().addAddress(
                            address: AddressModel(
                                name: nameController.text,
                                area: areaController.text,
                                district: districtController.text,
                                state: stateController.text,
                                pincode: pincodeController.text),
                          );

                          Get.back();
                        }
                      },
                      child: const Text('Submit')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AddAdressFields extends StatelessWidget {
  String? title;
  String? hint;
  TextEditingController controller = TextEditingController();
  AddAdressFields(
      {super.key,
      required this.title,
      required this.hint,
      required this.controller});

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
            controller: controller,
            decoration: InputDecoration(
                hintText: '$hint',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: kblack),
                    borderRadius: BorderRadius.circular(10))),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'this field is requiered';
              } else {
                return null;
              }
            },
          )
        ],
      ),
    );
  }
}
