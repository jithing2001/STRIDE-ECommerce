import 'package:ecommerce/constants.dart';
import 'package:ecommerce/view/checkout/widgets/address_detail.dart';
import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  IconData? icon;
  AddressCard({super.key, required this.icon});

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
            child: Card(
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
                          detail: 'Jithin',
                        ),
                        AddAdressWidget(
                          detail: 'Brototype',
                        ),
                        AddAdressWidget(
                          detail: 'Maradu',
                        ),
                        AddAdressWidget(
                          detail: 'Ernakulam',
                        ),
                        AddAdressWidget(
                          detail: 'Kerala',
                        ),
                        AddAdressWidget(
                          detail: '652648',
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(onPressed: () {}, icon: Icon(icon)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
