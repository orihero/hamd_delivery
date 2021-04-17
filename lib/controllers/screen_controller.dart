import 'package:get/get.dart';

class ScreenController extends GetxController {
  final screenIndex = 0.obs;
  selectOne() {
    screenIndex.value = 0;
    return screenIndex.value;
  }

  selectTwo() {
    screenIndex.value = 1;
    return screenIndex.value;
  }
}
