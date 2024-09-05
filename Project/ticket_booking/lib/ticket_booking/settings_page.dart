import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/ticket_booking/booking_controller.dart';

import 'booking_page.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  BokkingController controller = Get.put(BokkingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: controller.txtlimit,
              decoration: InputDecoration(labelText: "Limit"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: controller.txtPrice,
              decoration: InputDecoration(labelText: "Price"),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.saveSettings();
                  Get.to(() => BookingPage());
                },
                child: Text("Save"))
          ],
        ),
      ),
    );
  }
}
