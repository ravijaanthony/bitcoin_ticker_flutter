import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var jsonDecodeValue;
// double currencyValue = ;
String selectedCurrencyURL = selectedCurrencyURL;
double currencyValue = 0.0;

class CoinbaseCurrencyValues extends StatefulWidget {
  @override
  _CoinbaseCurrencyValuesState createState() => _CoinbaseCurrencyValuesState();
}

class _CoinbaseCurrencyValuesState extends State<CoinbaseCurrencyValues> {
  Map<String, dynamic>? bitcoinPriceData;
  var jsonDecodeValue;
  String url = 'https://api.coinbase.com/v2/prices/spot?currency=$selectedCurrencyURL';

  void printingData() {
    print(url);
  }

  Future<Map<String, dynamic>> fetchBitcoinPrice() async {
    printingData();
    try {
      // String url = 'https://api.coinbase.com/v2/prices/spot?currency=USD';
      // print(url);
      printingData();

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        jsonDecodeValue = jsonDecode(response.body)['data'];
        // return jsonDecode(response.body)['data'];
      } else {
        throw Exception('Failed to fetch Bitcoin price');
      }
    } catch (e) {
      print("Error: $e");
    }
    return jsonDecodeValue;
  }

  @override
  void initState() {
    super.initState();
    fetchBitcoinPrice().then((data) {
      setState(() {
        bitcoinPriceData = data;
        currencyValue = data as double;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    printingData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Bitcoin Price'),
      ),
      body: bitcoinPriceData != null
          ? Center(
              child: Text('Price: \$${bitcoinPriceData!['amount']}'),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
