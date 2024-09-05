import 'package:get/get.dart';

class CounterController extends GetxController {
  var count = 0.obs;
  increment() {
    count.value = count.value + 1;
  }

  decrement() {
    count.value = count.value + 1;
  }

  reset() {
    count.value = 0;
  }

  double() {
    count.value = count.value * 2;
  }
}
