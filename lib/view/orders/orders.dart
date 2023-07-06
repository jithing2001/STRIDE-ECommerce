import 'package:ecommerce/constants.dart';
import 'package:ecommerce/view/orders/widgets/order_tracker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
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
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Get.to( OrderTrackerClass()),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: kblack)),
                  child: Row(
                    children: [
                      kwidth10,
                      const SizedBox(
                        height: 60,
                        width: 60,
                        child: Image(
                          image: AssetImage('assets/images/images (1).png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      kwidth30,
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Adidas evolve',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text('Order Placed')
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete,
                            size: 30,
                          ))
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
