import 'package:ecommerce/model/cart_model.dart';
import 'package:ecommerce/service/cartservice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CartSizeController extends GetxController {
  int? sizeEdit;
  CartSizeController({int? initialSizeEdit}) : sizeEdit = initialSizeEdit;

  addSize({required CartModel product}) async {
    if (sizeEdit! < 12) {
      Get.dialog(Center(
        child: LoadingAnimationWidget.waveDots(color: Colors.white, size: 50),
      ));
      sizeEdit = sizeEdit! + 1;
      await CartService().editProductSize(product: product, size: sizeEdit!);
      update();
      Get.back();
    }
  }

  removeSize({required CartModel product}) async {
    if (sizeEdit! > 8) {
      Get.dialog(Center(
        child: LoadingAnimationWidget.waveDots(color: Colors.white, size: 50),
      ));
      sizeEdit = sizeEdit! - 1;

      await CartService().editProductSize(product: product, size: sizeEdit!);
      update();
      Get.back();
    }
  }
}
