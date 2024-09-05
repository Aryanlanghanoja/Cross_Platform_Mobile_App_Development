import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'counter_controller.dart';

class CountDisplay extends StatelessWidget {
  CountDisplay({super.key});
  CounterController controller = Get.find<CounterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Count display'),
        ),
        body: Column(
          children: [
            Obx(() {
              return Text(
                "Counter : ${controller.count}",
                style: TextStyle(fontSize: 40),
              );
            }),
            ElevatedButton(
                onPressed: () {
                  controller.double();
                },
                child: Text('x2'))
          ],
        ));
  }
}
