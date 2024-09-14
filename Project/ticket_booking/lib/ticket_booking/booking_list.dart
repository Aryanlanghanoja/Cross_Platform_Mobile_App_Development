import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'booking_controller.dart';

class BookingList extends StatelessWidget {
  BookingList({super.key});
  BookingController controller = Get.find<BookingController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking List'),
      ),
      body: Obx(() {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                    'Remaining Seats:${controller.limit.value - controller.booked.value}',
                    style: TextStyle(fontSize: 20)),
                Text(
                    'Earning:${controller.price.value * controller.booked.value}',
                    style: TextStyle(fontSize: 20)),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.bookings.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text('${controller.bookings[index].name}'),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text('${controller.bookings[index].count}')),
                      Expanded(
                          child: Text(
                              '${controller.bookings[index].count * controller.price.value}')),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
