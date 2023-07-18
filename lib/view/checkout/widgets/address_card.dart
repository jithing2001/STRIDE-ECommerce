import 'package:ecommerce/constants.dart';
import 'package:ecommerce/controllers/address_controller.dart';
import 'package:ecommerce/model/address_model.dart';
import 'package:ecommerce/service/address_service.dart';
import 'package:ecommerce/view/checkout/widgets/address_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressCard extends StatelessWidget {
  final AddressModel address;
  int index;
  int? tappedIndex;

  AddressCard(
      {super.key,
      required this.address,
      required this.index,
      required this.tappedIndex});

  AddressController ad = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          kheight30,
          SizedBox(
            height: 170,
            width: double.infinity,
            child: GetBuilder<AddressController>(
                init: ad,
                builder: (controller) {
                  return Card(
                    color: (index == controller.selectedIdx)
                        ? Colors.grey
                        : kwhite,
                    shadowColor: kblack,
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AddAdressWidget(
                                detail:
                                    '${address.name}\n${address.area}\n${address.district}\n${address.state}\n${address.pincode}',
                              ),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () async {
                                await AddressServices()
                                    .removeAddress(address: address);
                              },
                              icon: const Icon(Icons.delete))
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
