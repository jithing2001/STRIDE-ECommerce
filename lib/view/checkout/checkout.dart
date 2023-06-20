import 'package:ecommerce/constants.dart';
import 'package:ecommerce/view/checkout/widgets/payment_widgets.dart';
import 'package:ecommerce/view/checkout/widgets/shipping_address_widget.dart';
import 'package:ecommerce/view/checkout/widgets/shipping_addresses.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

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
            'Checkout',
            style: TextStyle(fontSize: 25, color: Colors.black),
          ),
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kheight30,
                const Text(
                  'Shipping Address',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                kheight10,
                Container(
                  height: 150,
                  width: 350,
                  decoration: BoxDecoration(
                      border: Border.all(color: kblack),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          kheight10,
                          ShippingFields(
                            detail: 'Jithin G',
                          ),
                          ShippingFields(detail: 'Brotoype'),
                          ShippingFields(detail: 'Marad'),
                          ShippingFields(detail: 'Ernakulam'),
                          ShippingFields(detail: 'Kerala'),
                          ShippingFields(detail: '658692'),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            Get.to(ShippingAddress());
                          },
                          icon: const Icon(
                            Icons.add_location_alt_rounded,
                            size: 30,
                          ))
                    ],
                  ),
                ),
                kheight10,
                const Text(
                  'Order List',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 290,
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: kblack)),
                          child: Row(
                            children: [
                              const SizedBox(
                                height: 100,
                                width: 100,
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/puma laceup.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              kwidth30,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Nike Flex Control',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text('₹2500',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  kheight10,
                                  Container(
                                    height: 25,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: kblack)),
                                    child: const Center(
                                        child: Text(
                                      '1',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    )),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: kblack),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Select the Payment Method',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          PaymentsWidgets(
                              imgPath: 'assets/images/razor_pay_icon.png',
                              payments: 'Razorpay',
                              icon: Icons.radio_button_unchecked),
                          kheight5,
                          PaymentsWidgets(
                              imgPath: 'assets/images/pngwing.com (7).png',
                              payments: 'COD',
                              icon: Icons.radio_button_checked),
                          kheight5,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Total',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              kwidth30,
                              Text(
                                '₹10000',
                                style: TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                    color: kblue),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text('Confirm Payment')),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
