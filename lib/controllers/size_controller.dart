import 'package:get/get.dart';

class SizeController extends GetxController {
  RxInt selectedindex = 0.obs;

  sizeSelected(int index) {
    selectedindex.value = index;
  }
}
