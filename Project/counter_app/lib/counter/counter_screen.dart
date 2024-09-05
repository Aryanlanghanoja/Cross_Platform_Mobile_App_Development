import 'package:counter_app/counter/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'count_display.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({super.key});
  CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Counter App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Text(
                "Counter : ${controller.count}",
                style: TextStyle(fontSize: 40),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    controller.increment();
                  },
                  icon: Icon(Icons.add),
                ),
                IconButton(
                  onPressed: () {
                    controller.decrement();
                  },
                  icon: Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () {
                    controller.reset();
                  },
                  icon: Icon(Icons.refresh),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CountDisplay()));
                },
                child: Text('Display'))
          ],
        ));
  }
}
