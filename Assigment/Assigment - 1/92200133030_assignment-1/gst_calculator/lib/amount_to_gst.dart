import 'package:flutter/material.dart';

class AmountToGST extends StatefulWidget {
  const AmountToGST({super.key});

  @override
  State<AmountToGST> createState() => _AmountToGSTState();
}

class _AmountToGSTState extends State<AmountToGST> {
  double igst = 0;
  double cgst = 0;
  double sgst = 0;
  double tgst = 0;

  TextStyle fontStyle = const TextStyle(fontSize: 18);

  TextEditingController amntController = TextEditingController();
  TextEditingController gstPerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Amount to GST")),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Column(
          children: [
            TextField(
              controller: amntController,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                label: const Text("Amount"), // Label for the amount input field
              ),
            ),
            const SizedBox(height: 20,),
            TextField(
              controller: gstPerController,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                label: const Text("GST Percentage"), // Label for the GST percentage input field
              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                double amnt = double.parse(amntController.text);
                double gstPer = double.parse(gstPerController.text);
                igst = amnt * gstPer * 0.01; // Calculate IGST
                cgst = (amnt * gstPer * 0.01) / 2; // Calculate CGST
                sgst = (amnt * gstPer * 0.01) / 2; // Calculate SGST
                tgst = amnt + (amnt * gstPer * 0.01); // Calculate the total amount with GST
                setState(() {});
              },
              child: const Text("Calculate"),
            ),
            const SizedBox(height: 20,),
            Text(
              "IGST Amount : $igst", // Display IGST amount
              style: fontStyle,
            ),
            Text(
              "CGST Amount : $cgst", // Display CGST amount
              style: fontStyle,
            ),
            Text(
              "SGST Amount : $sgst", // Display SGST amount
              style: fontStyle,
            ),
            Text(
              "Total Amount with GST: $tgst", // Display total amount with GST
              style: fontStyle,
            ),
          ],
        ),
      ),
    );
  }
}
