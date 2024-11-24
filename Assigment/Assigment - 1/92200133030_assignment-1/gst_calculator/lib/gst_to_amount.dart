import 'package:flutter/material.dart';

class GSTToAmount extends StatefulWidget {
  const GSTToAmount({super.key});

  @override
  State<GSTToAmount> createState() => _GSTToAmountState();
}

class _GSTToAmountState extends State<GSTToAmount> {
  double amnt = 0;

  TextEditingController amntController = TextEditingController();
  TextEditingController gstPerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GST to Amount")),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Column(
          children: [
            TextField(
              controller: amntController,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                label: const Text("Total Amount With GST"),
              ),
            ),
            const SizedBox(height: 20,),
            TextField(
              controller: gstPerController,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                label: const Text("GST Percentage"),
              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                double tamnt = double.parse(amntController.text); // Get total amount from textfield
                double gstPer = double.parse(gstPerController.text); // Get GST Percentage from textfield
                amnt = tamnt / (1 + gstPer * 0.01); // Calculate the amount
                setState(() {});
              },
              child: const Text("Calculate"),
            ),
            const SizedBox(height: 20,),
            Text(
              "Amount : ${amnt.toStringAsFixed(2)}", // Display the calculated amount
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
