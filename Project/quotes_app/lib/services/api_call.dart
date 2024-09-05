import 'package:http/http.dart' as http;

import '../models/quote.dart';

class ApiCall {
  static fetchQuote() async {
    List<Quote> quotes = [];
    var request =
        http.Request('GET', Uri.parse('https://zenquotes.io/api/random'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      print(res);
      quotes = quoteFromJson(res);
    } else {
      print(response.reasonPhrase);
    }
    return quotes;
  }
}
