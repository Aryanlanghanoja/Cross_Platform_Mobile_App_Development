import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/ticket_booking/booking_model.dart';

class BookingController extends GetxController {
  var limit = 0.obs;
  var booked = 0.obs;
  var price = 0.0.obs;
  var msg = ''.obs;
  RxList<BookingModel> bookings = RxList.empty();

  TextEditingController txtLimit = TextEditingController();
  TextEditingController txtPrice = TextEditingController();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtCount = TextEditingController();
  saveSettings() {
    limit.value = int.parse(txtLimit.text);
    price.value = double.parse(txtPrice.text);
  }

  bookTicket() {
    try {
      var cnt = int.parse(txtCount.text);
      if (cnt > (limit.value - booked.value)) {
        Get.snackbar(
          'Error',
          'Entered Qty is more than available',
          backgroundColor: Colors.red,
          colorText: Colors.yellow,
        );
      } else if (txtName.text.isEmpty) {
        Get.snackbar(
          'Error',
          'Name is empty',
          backgroundColor: Colors.orangeAccent,
          colorText: Colors.yellow,
        );
      } else {
        bookings.add(BookingModel(txtName.text, cnt));
        booked.value += cnt;
        txtName.clear();
        txtCount.clear();
        Get.snackbar('Success', 'Booking done successfully');
      }
    } catch (e) {
      Get.snackbar('Error', 'Error in booking',
          backgroundColor: Colors.purpleAccent);
    }
  }
}
