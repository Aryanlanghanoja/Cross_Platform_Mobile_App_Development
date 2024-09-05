import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/ticket_booking/booking_controller.dart';

class BookingPage extends StatelessWidget {
  BookingPage({super.key});
  BokkingController controller = Get.find<BokkingController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking"),
      ),
      body: Column(
        children: [
          Obx(() {
            return Text(
                'Available: ${controller.limit.value - controller.booked.value}');
          }),
          TextField(
            decoration: InputDecoration(labelText: "Name"),
            controller: controller.txtName,
          ),
          TextField(
            decoration: InputDecoration(labelText: "Ticket"),
            controller: controller.txtCount,
          ),
          ElevatedButton(
              onPressed: () {
                controller.book();
              },
              child: Text("Save"))
        ],
      ),
    );
  }
}
