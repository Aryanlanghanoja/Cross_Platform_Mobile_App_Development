import 'package:http/http.dart' as http;

import '../models/quote.dart';

class ApiCall {
  static fetchQuote() async {
    List<Quote> quotes = [];
    var request =
        // http.Request('GET', Uri.parse('https://zenquotes.io/api/random'));
        http.Request('GET', Uri.parse('http://localhost:3000/api/quote'));

    http.StreamedResponse response = await request.send();
    try {
      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } 
    
catch (e) {
      print('Exception: $e');
    }

  

    return quotes;
  }
}
