import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

var asset_id_base = "BTC";
var asset_id_quote = "USD";

class ExchangeRates {
  String formattedNumberCurrency = '';
  var _apiKey = '9F09CC1F-1E7B-45ED-8CA1-F56AA0F0375F';

// const url = 'https://rest.coinapi.io/v1/exchangerate/BTC';

  // class CoinData {}

  // String currencyInList() {
  //   String currencyFromList = "USD";
  //   for (String currency in currenciesList) {
  //     currencyFromList = currency;
  //   }
  //   return currencyFromList;
  // }

  double roundDouble(double value, int place) {
    num mod = pow(value, place);
    return ((value * mod).roundToDouble()) / mod;
  }

  Future coinRates() async {
    double jsonFileCurrencyRate;

    // GET /v1/exchangerate/BTC?apikey=73034021-THIS-IS-SAMPLE-KEY

    var url = Uri.parse('https://rest.coinapi.io/v1/exchangerate/$asset_id_base/$asset_id_quote');
    var headers = {'X-CoinAPI-Key': _apiKey};

    // Network network = Network("$url?apikey=$_apiKey");

    var response = await http.get(url, headers: headers);

    print("Waiting for response ... ");
    // String jsonFile = response.body;

    NumberFormat formatter = NumberFormat('#,##0.00');

    print(response.statusCode);
    if (response.statusCode == 200) {
      // var jsondecode = jsonDecode(response.body);
      // jsonFileCurrencyRate = jsondecode('rate');
      // var jsondecode=doublejsonDecode(response.body)['rate']
      // print(jsondecode);

      jsonFileCurrencyRate = jsonDecode(response.body)['rate'];

      // print(jsonFileCurrencyRate);
      // String jsonFileCurrencyRateString = jsonFileCurrencyRate.toStringAsFixed(2);
      // print(jsonFileCurrencyRateString);

      formattedNumberCurrency = formatter.format(jsonFileCurrencyRate);
      print(formattedNumberCurrency);
    }
    // var value = await network.getData();
    // print()
  }
}
