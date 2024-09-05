import 'package:flutter/material.dart';

class GstCalcScreen extends StatefulWidget {
  const GstCalcScreen({super.key});

  @override
  State<GstCalcScreen> createState() => _GstCalcScreenState();
}

class _GstCalcScreenState extends State<GstCalcScreen> {
  TextEditingController txtAmnt = TextEditingController();
  TextEditingController txtGst = TextEditingController();
  TextEditingController txtTotalAmnt = TextEditingController();
  var igst = 0.0;
  var cgst = 0.0;
  var sgst = 0.0;
  bool isGst = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GST Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SwitchListTile(
              value: isGst,
              onChanged: (v) {
                setState(() {
                  isGst = v;
                });
              },
              title: Text('GST'),
            ),
            TextField(
              controller: txtAmnt,
              decoration: InputDecoration(
                hintText: 'Product Amount',
                labelText: 'Amount',
              ),
            ),
            TextField(
              controller: txtGst,
              decoration: InputDecoration(
                hintText: 'GST Percentage',
                labelText: 'GST%',
              ),
            ),
            Text('SGST: ${sgst.toStringAsFixed(2)}'),
            Text('CGST: ${cgst.toStringAsFixed(2)}'),
            Text('IGST: ${igst.toStringAsFixed(2)}'),
            TextField(
              controller: txtTotalAmnt,
              decoration: InputDecoration(
                hintText: 'Total Amount',
                labelText: 'Total Amount',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (isGst) {
                  //calculate gst components and total amount
                  if (txtAmnt.text.isNotEmpty && txtGst.text.isNotEmpty) {
                    igst = double.parse(txtAmnt.text) *
                        double.parse(txtGst.text) *
                        0.01;
                    cgst = igst * 0.5;
                    sgst = igst * 0.5;
                    txtTotalAmnt.text =
                        (double.parse(txtAmnt.text) + igst).toString();
                    setState(() {});
                  }
                } else {
                  //calculate gst components and  amount
                  if (txtTotalAmnt.text.isNotEmpty && txtGst.text.isNotEmpty) {
                    var amnt = double.parse(txtTotalAmnt.text) /
                        (1 + (double.parse(txtGst.text) * 0.01));
                    igst = amnt * double.parse(txtGst.text) * 0.01;
                    cgst = igst * 0.5;
                    sgst = igst * 0.5;
                    txtAmnt.text = amnt.toStringAsFixed(2);
                    setState(() {});
                  }
                }
              },
              child: Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }
}
