import 'dart:developer';

import 'package:get/get.dart';

class QuantityController extends GetxController {
  // RxInt number = 1.obs;
  RxInt count = 1.obs;

  addQuantity() {
    // number++;

    count.value++;
    log('${count.value}');
  }

  removeQuantity() {
    // number--;
    count.value--;
  }
}
