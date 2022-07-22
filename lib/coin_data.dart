import 'package:http/http.dart' as http;
import 'dart:convert';
import 'price_screen.dart';
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




class CoinData {

  String Currency = currenciesList[0];
/// 6S> changed function to have input(Argument)
  Future getcoinData( String selectedCurrency) async {
    http.Response response = await http.get(Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/BTC/$selectedCurrency?apikey=C6AF62E9-D9AC-4506-9AAA-FCBF49E3E039#'));
    if (response.statusCode == 200) {
      var data = response.body;
      var rate = jsonDecode(data)['rate']; ///To get the information we needed (From Json format)
      print(rate); //>>Example


      return rate ;
    } else {
      // throw 'Problem with the get request';
      print(response.statusCode);
      print(response.body);
    }
  }
  Future ETHgetcoinData( String selectedCurrency) async {
    http.Response response = await http.get(Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/ETH/$selectedCurrency?apikey=C6AF62E9-D9AC-4506-9AAA-FCBF49E3E039#'));
    if (response.statusCode == 200) {
      var data = response.body;
      var rate = jsonDecode(data)['rate']; ///To get the information we needed (From Json format)
      print(rate); //>>Example


      return rate ;
    } else {
      // throw 'Problem with the get request';
      print(response.statusCode);
      print(response.body);
    }
  }
  Future LTCgetcoinData( String selectedCurrency) async {
    http.Response response = await http.get(Uri.parse(
        'https://rest.coinapi.io/v1/exchangerate/LTC/$selectedCurrency?apikey=C6AF62E9-D9AC-4506-9AAA-FCBF49E3E039#'));
    if (response.statusCode == 200) {
      var data = response.body;
      var rate = jsonDecode(data)['rate']; ///To get the information we needed (From Json format)
      print(rate); //>>Example


      return rate ;
    } else {
      // throw 'Problem with the get request';
      print(response.statusCode);
      print(response.body);
    }
  }
}

//class CoinData {
//
//   String Currency = currenciesList[0];
//   List Crypto = [];
// /// 6S> changed function to have input(Argument)
//   Future getcoinData( String selectedCurrency) async {
//     http.Response BTCresponse = await http.get(Uri.parse(
//         'https://rest.coinapi.io/v1/exchangerate/BTC/$selectedCurrency?apikey=C6AF62E9-D9AC-4506-9AAA-FCBF49E3E039#'));
//     http.Response ETHresponse = await http.get(Uri.parse(
//         'https://rest.coinapi.io/v1/exchangerate/ETH/$selectedCurrency?apikey=C6AF62E9-D9AC-4506-9AAA-FCBF49E3E039#'));
//     http.Response LTCresponse = await http.get(Uri.parse(
//         'https://rest.coinapi.io/v1/exchangerate/LTC/$selectedCurrency?apikey=C6AF62E9-D9AC-4506-9AAA-FCBF49E3E039#'));
//     if (BTCresponse.statusCode == 200) {
//       var data = BTCresponse.body;
//       var BTCrate = jsonDecode(data)['rate']; ///To get the information we needed (From Json format)
//       print(BTCrate); //>>Example
//     } else {
//       // throw 'Problem with the get request';
//       print(BTCresponse.statusCode);
//       print(BTCresponse.body);
//     }
//
//     if (ETHresponse.statusCode == 200) {
//       var data = ETHresponse.body;
//       var ETHrate = jsonDecode(data)['rate']; ///To get the information we needed (From Json format)
//       print(ETHrate); //>>Example
//     } else {
//       // throw 'Problem with the get request';
//       print(ETHresponse.statusCode);
//       print(ETHresponse.body);
//     }
//
//     if (LTCresponse.statusCode == 200) {
//       var data = LTCresponse.body;
//       var LTCrate = jsonDecode(data)['rate']; ///To get the information we needed (From Json format)
//       print(LTCrate); //>>Example
//     } else {
//       // throw 'Problem with the get request';
//       print(LTCresponse.statusCode);
//       print(LTCresponse.body);
//     }
//     return Crypto[BTCresponse.body, LTCresponse.body, ETHresponse.body];
//   }
// }