import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/ticket_booking/booking_model.dart';

class BokkingController extends GetxController {
  var limit = 0.obs;
  var price = 0.0.obs;
  var booked = 0.obs;
  RxList<BookingModel> bookings = RxList.empty();

  TextEditingController txtlimit = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtCount = TextEditingController();
  saveSettings() {
    limit.value = int.parse(txtlimit.text);
    price.value = double.parse(txtPrice.text);
  }

  book() {
    var cnt = int.parse(txtCount.text);
    booked.value += cnt;
    txtName.clear();
    txtCount.clear();
    Get.snackbar('Success', "Booking Done Sucessfully!");
  }
}
