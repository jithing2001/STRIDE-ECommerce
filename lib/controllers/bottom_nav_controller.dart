import 'package:get/get.dart';

class NavController extends GetxController {
  int selectedIndex = 0;

  void changePage(int index) {
    selectedIndex = index;
    update();
  }
}
