import 'dart:developer';

import 'package:get/get.dart';

class TrackerController extends GetxController {
  RxInt count = 0.obs;

  addTrack() {
    count.value = count.value + 1;
    log(count.value.toString());
  }
}
