import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/model/order_model.dart';
import 'package:flutter/material.dart';

class Order_Detail extends StatelessWidget {
  OrderModel order;
  Order_Detail({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Details',
          style: TextStyle(color: kblack, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: kwhite,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kheight30,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 310,
                    width: 380,
                    child: AnotherCarousel(
                      images: [
                        NetworkImage(order.productImg1),
                        NetworkImage(order.productImg2),
                        NetworkImage(order.productImg3),
                      ],
                    )),
              ],
            ),
            kheight20,
            Row(
              children: [
                kwidth25,
                Text(
                  order.productName,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                kwidth25,
                Text(
                  "₹${order.discountPrice}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30, color: kgreen),
                )
              ],
            ),
            Row(
              children: [
                kwidth25,
                Text("Selected Size:${order.productSize}"),
              ],
            ),
            kheight10,
            Row(
              children: [
                kwidth25,
                SizedBox(width: 380, child: Text(order.productDes)),
              ],
            ),
            kheight20,
            Row(
              children: [
                kwidth25,
                Text(
                  "Order Status:${order.deliveryStatus}",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
