import 'package:get/get.dart';

class CartProductRate extends GetxController {
  RxInt total = 0.obs;

  productRate(int quantity, int price) {
    total.value = quantity * price;
  }
}
