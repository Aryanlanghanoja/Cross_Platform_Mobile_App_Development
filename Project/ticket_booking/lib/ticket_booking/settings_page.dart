import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/ticket_booking/booking_controller.dart';

import 'booking_page.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});
  BookingController controller = Get.put(BookingController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Settings ',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: SafeArea(
          child: Column(
            children: [
              TextField(
                controller: controller.txtLimit,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Limit',
                ),
              ),
              TextField(
                controller: controller.txtPrice,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Price',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.saveSettings();
                  controller.bookTicket();
                  Get.to(() => BookingPage());
                },
                child: Text('Save'),
              ),
            ],
          ),
        ));
  }
}
