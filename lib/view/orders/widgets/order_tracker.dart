import 'package:ecommerce/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_tracker/order_tracker.dart';

class OrderTrackerClass extends StatefulWidget {
  const OrderTrackerClass({Key? key}) : super(key: key);

  @override
  State<OrderTrackerClass> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<OrderTrackerClass> {
  List<TextDto> orderList = [
    TextDto("Your order has been placed", ""),
    TextDto("Seller processed your order", ""),
    TextDto("Your item has been picked up by courier partner.", ""),
  ];

  List<TextDto> shippedList = [
    TextDto("Your order has been shipped", ""),
    TextDto("Your item has been received in the nearest hub to you.", null),
  ];

  List<TextDto> outOfDeliveryList = [
    TextDto("Your order is out for delivery", ""),
  ];

  List<TextDto> deliveredList = [
    TextDto("Your order has been delivered", ""),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        title: const Text(
          'Track Your Order',
          style: TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kwhite,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: kblack,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: OrderTracker(
          status: Status.delivered,
          activeColor: Colors.green,
          inActiveColor: Colors.grey[300],
          orderTitleAndDateList: orderList,
          shippedTitleAndDateList: shippedList,
          outOfDeliveryTitleAndDateList: outOfDeliveryList,
          deliveredTitleAndDateList: deliveredList,
        ),
      ),
    );
  }
}
