import 'dart:convert';

import 'package:http/http.dart' as http;

class Network {
  Network(this.url);

  final String url;

  // 'https://api.coinbase.com/v2/prices/spot?currency=$selectedCurrency';

  Future fetchBitcoinPrice() async {
    // String url = 'https://api.coinbase.com/v2/prices/spot?currency=USD';
    // print("Waiting for response ... ");

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    } else {
      throw Exception('Failed to fetch Bitcoin price');
    }
  }
}
