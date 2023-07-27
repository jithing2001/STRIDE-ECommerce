import 'dart:developer';
import 'package:ecommerce/service/cartservice.dart';
import 'package:ecommerce/service/my_order_service.dart';
import 'package:ecommerce/view/orders/orders.dart';
import 'package:ecommerce/view/success/success.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Razor {
  final orderList;
  Razor({required this.orderList});

  Razorpay razorpay = Razorpay();
  var sum = 00.00;

  totalamount() {
    for (var element in orderList) {
      sum = sum + int.parse(element.discountPrice);
    }
  }

  pay() {
    totalamount();
    var options = {
      'key': 'rzp_test_8caRwcuFY7rVRL',
      'amount': sum,
      'name': 'Stride',
      'description': sum,
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
    Get.dialog(const AlertDialog(
      content: Text('payment failed'),
    ));
  }

  void handlePaymentSuccessResponse(
    PaymentSuccessResponse response,
  ) async {
    log(response.toString());
    for (var order in orderList) {
      await MyOrderService().addOrder(order);
    }
    log('success');
    await CartService().deleteWholeCart();
    Get.to(const Success());
  }

  void handleExternalWalletSelected(
      ExternalWalletResponse response, BuildContext context) async {
    Get.dialog(const AlertDialog(
      content: Text('selected wallet'),
    ));
  }
}
