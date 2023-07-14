// import 'dart:convert';
// import 'dart:core';
//
// import 'package:flutter/material.dart';
//
// var jsonDecodeValue;
// // double currencyValue = ;
// String selectedCurrency = selectedCurrency;
// double currencyValue = 0.0;
//
// class CoinbaseCurrencyValues extends StatefulWidget {
//   const CoinbaseCurrencyValues({super.key});
//
//   @override
//   _CoinbaseCurrencyValuesState createState() => _CoinbaseCurrencyValuesState();
// }
//
// class _CoinbaseCurrencyValuesState extends State<CoinbaseCurrencyValues> {
//   Map<String, dynamic>? bitcoinPriceData;
//   var jsonDecodeValue;
//
//   // Future<Map<String, dynamic>> fetchBitcoinPrice() async {
//
//   @override
//   void initState() {
//     print("Hi");
//     super.initState();
//
//     fetchBitcoinPrice().then((data) {
//       print("Done?!");
//       printData(data);
//       // printData(jsonDecodeValue);
//
//       // fetchBitcoinPrice();
//
//       setState(() {
//         bitcoinPriceData = data;
//         currencyValue = data as double;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Bitcoin Price'),
//       ),
//       body: bitcoinPriceData != null
//           ? Center(
//               child: Text('Price: \$${bitcoinPriceData!['amount']}'),
//             )
//           : Center(
//               child: CircularProgressIndicator(),
//             ),
//     );
//   }
// }
//
// void printData(jsonDecodeValue) {
//   print(jsonDecodeValue['amount']);
//   print("Bye");
// }
