import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coin_data.dart';

// Future<Map<String, dynamic>> coinbaseValue = CoinbaseCurrencyValues().fetchBitcoinPrice();

// CoinbaseCurrencyValues coinbaseCurrencyValues = CoinbaseCurrencyValues();
ExchangeRates exchangeRates = ExchangeRates();
// var assetIDQuote = exchangeRates.asset_id_quote;
// var assetIDBase = exchangeRates.asset_id_base;

String selectedCurrencyType = "USD";
//

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  DropdownButton androidDropdown() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    print(selectedCurrencyType);

    // fetchBitcoinPrice().then((data) {
    //   print(data['amount']);
    // });

    for (String value in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(value),
        value: value,
      );
      dropDownItems.add(newItem);
    }

    return DropdownButton(
      value: selectedCurrencyType,
      items: dropDownItems,
      onChanged: (value) {
        asset_id_quote = value;

        setState(() {
          selectedCurrencyType = value!;
          exchangeRates.coinRates();
          // fetchBitcoinPrice();
          // coinbaseCurrencyValues;
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItemList = [];

    for (String currency in currenciesList) {
      pickerItemList.add(Text(currency));
    }

    return CupertinoPicker(
        backgroundColor: Colors.lightBlue,
        itemExtent: 32,
        onSelectedItemChanged: (selectedIndex) {
          print(selectedIndex);
        },
        children: pickerItemList);
  }

  // To find which OS this code is running
  Widget getPicker() {
    if (Platform.isIOS) {
      return iOSPicker();
    } else if (Platform.isAndroid) {
      return androidDropdown();
    }
    return iOSPicker();
  }

  @override
  Widget build(BuildContext context) {
    String finalCurrencyValue = exchangeRates.formattedNumberCurrency;
    androidDropdown();

    return Scaffold(
        appBar: AppBar(
          title: Text('🤑 Coin Ticker'),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
          Padding(
              padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
              child: Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                      child: Text('1 $asset_id_base = $finalCurrencyValue $asset_id_quote',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ))))),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isAndroid ? androidDropdown() : iOSPicker(), // Ternary operator to find the running OS
          )
        ]));
  }
}
