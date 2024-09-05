import 'package:flutter/material.dart';
import 'package:quotes_app/services/api_call.dart';

import '../models/quote.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  List<Quote> qts = [];
  @override
  void initState() {
    super.initState();
    fetchQuotes();
  }

  fetchQuotes() async {
    qts = await ApiCall.fetchQuote();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quote App'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: qts.isEmpty
            ? CircularProgressIndicator()
            : Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  qts[0].q,
                  style: TextStyle(fontSize: 40),
                ),
                Text(
                  qts[0].a,
                  style: TextStyle(fontSize: 18),
                ),
              ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchQuotes();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
