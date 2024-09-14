import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_booking/ticket_booking/booking_controller.dart';
import 'package:ticket_booking/ticket_booking/booking_list.dart';

class BookingPage extends StatelessWidget {
  BookingPage({super.key});
  BookingController controller = Get.find<BookingController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Booking'),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(() => BookingList());
              },
              icon: Icon(Icons.menu),
            ),
          ],
        ),
        body: Column(
          children: [
            Obx(() {
              return Text(
                  'Available: ${controller.limit.value - controller.booked.value}',
                  style: TextStyle(fontSize: 20));
            }),
            TextField(
              controller: controller.txtName,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: controller.txtCount,
              decoration: InputDecoration(
                labelText: 'Ticket Count',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                controller.bookTicket();
              },
              child: Text('Save'),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5),
                itemCount: controller.limit.value,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    //logic to perform action
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                      ),
                      alignment: Alignment.center,
                      child: Text('${index + 1}'),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
