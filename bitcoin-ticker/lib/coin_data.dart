import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  Future<Map<String, String>> getCoinData(String currencyType) async {
    Map<String, String> mapOfRates = {};
    for (String crypto in cryptoList) {
      http.Response response = await http.get(
          "https://rest.coinapi.io/v1/exchangerate/$crypto/$currencyType?apikey=EBBA5086-6E67-440B-BFC7-070551184729");
      var decodedResponse = jsonDecode(response.body);
      double rate = decodedResponse["rate"];
      mapOfRates[crypto] = rate.toStringAsFixed(2);
    }
    return mapOfRates;
  }
}
