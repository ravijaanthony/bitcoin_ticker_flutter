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
// var generate;
//

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  DropdownButton androidDropdown() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    // List
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
          generatingWidget();
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

  // @override
  // void initState() {
  //   super.initState();
  //   generate = generatingWidget();
  // }

  dynamic generatingWidget() {
    List<Widget> generatingAWidget = List.generate(
      cryptoList.length,
      (index) {
        String base = cryptoList[index];
        String finalCurrencyValue = exchangeRates.formattedNumberCurrency;

        return Padding(
          padding: const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 0),
          child: Card(
            color: Colors.lightBlueAccent,
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Text(
                '1 $base = $finalCurrencyValue $asset_id_quote',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                ),
              ),
            ),
            //
            // textAlign: TextAlign.center,
          ),
        );
      },
    );
    return generatingAWidget;
  }

  @override
  Widget build(BuildContext context) {
    generatingWidget();
    // generatingWidget().generatingAWidget;
    // String finalCurrencyValue = exchangeRates.formattedNumberCurrency;
    // androidDropdown();

    return Scaffold(
        appBar: AppBar(
          title: Text('🤑 Coin Ticker'),
        ),
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
              generatingWidget(),
              // ...generatingAWidget,
              // generatingWidget(),
              Container(
                height: 150.0,
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 30.0),
                color: Colors.lightBlue,
                child: Platform.isAndroid ? androidDropdown() : iOSPicker(), // Ternary operator to find the running OS
              ),
            ]);
            return generatingWidget();
          },
          // child: ,
        ));
  }
}
