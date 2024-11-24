import 'package:flutter/material.dart';
import 'package:gst_calculator/amount_to_gst.dart';
import 'package:gst_calculator/gst_to_amount.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold provide basic app structure with app bars, body, drawers, etc.
      body: SafeArea(
        // SafeArea ensures content doesn't overlap with device's status bar
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Navigate to the AmountToGST screen when this button is pressed
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (builder) => const AmountToGST()));
                },
                child: const Text("Amount to GST"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the GSTToAmount screen when this button is pressed
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (builder) => const GSTToAmount()));
                },
                child: const Text("GST to Amount"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
