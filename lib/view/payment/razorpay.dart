import 'dart:developer';
import 'package:ecommerce/model/order_model.dart';
import 'package:ecommerce/service/my_order_service.dart';
import 'package:ecommerce/view/orders/orders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Razor {
  OrderModel order;
  Razor({required this.order});

  Razorpay razorpay = Razorpay();

  pay() {
    var options = {
      'key': 'rzp_test_8caRwcuFY7rVRL',
      'amount': (int.parse(order.discountPrice)),
      'name': 'Stride',
      'description': int.parse(order.discountPrice) + 200 * 100,
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '7025778330', 'email': 'jithinkyd70@gmail.com'},
      'external': {
      'wallets': ['paytm']
      }
    };

    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
    razorpay.open(options);
  }

  void handlePaymentErrorResponse(
      PaymentFailureResponse response, BuildContext context) {
    Get.dialog(Alert(
      title: 'payment Failed',
      msg1: response.code,
      msg2: response.message,
    ));
  }

  void handlePaymentSuccessResponse(
    PaymentSuccessResponse response,
  ) async {
    log(response.toString());
    await MyOrderService().addOrder(order);
    log(order.productName);
    log('success');
    Get.dialog(Alert(
      title: 'You Order Successfull',
      msg1: 'check MyOrder for more details',
      msg2: 'thank you',
    ));
  }

  void handleExternalWalletSelected(
      ExternalWalletResponse response, BuildContext context) async {
    Get.dialog(Alert(
        title: 'External Wallet Selected', msg1: 'Selected', msg2: 'Selected'));
  }
}

class Alert extends StatelessWidget {
  String title;
  final msg1;
  final msg2;
  Alert(
      {super.key, required this.title, required this.msg1, required this.msg2});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text('$msg1\n$msg2'),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.to(MyOrders());
                },
                child: const Text('Enter'))
          ],
        )
      ],
    );
  }
}
