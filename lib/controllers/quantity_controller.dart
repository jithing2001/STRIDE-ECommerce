import 'dart:developer';

import 'package:get/get.dart';

class QuantityController extends GetxController {
  RxInt total = 0.obs;
  List<int> priceList = [];

  void findTotal() {
    for (int x in priceList) {
      total = total + x;
    }
    log(total.toString());
    update();
  }

  void addTotal(int price) {
    total += price;
    log(total.toString());
    update();
  }

  void removeTotal(int price) {
    total -= price;
    log(total.toString());
    update();
  }
}
