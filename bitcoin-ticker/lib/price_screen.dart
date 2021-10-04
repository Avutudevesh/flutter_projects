import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

import 'coin_data.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'GBP';
  Map<String, String> exchangeRate = initExchangeRates();
  CoinData coinData = CoinData();
  @override
  void initState() {
    super.initState();
    getData();
  }

  static Map<String, String> initExchangeRates() {
    Map<String, String> initMap = {};
    for (String crypto in cryptoList) {
      initMap[crypto] = "?";
    }
    return initMap;
  }

  void getData() async {
    Map<String, String> rate = await coinData.getCoinData(selectedCurrency);
    setState(() {
      exchangeRate = rate;
    });
  }

  Widget getDropDownMenu() {
    List<DropdownMenuItem<String>> list = [];
    for (String currency in currenciesList) {
      list.add(
        DropdownMenuItem(
          child: Text(currency),
          value: currency,
        ),
      );
    }
    return DropdownButton(
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          exchangeRate = initExchangeRates();
          getData();
        });
      },
      value: selectedCurrency,
      items: list,
    );
  }

  Widget getPicker() {
    List<Text> list = [];
    for (String currency in currenciesList) {
      list.add(Text(currency));
    }
    return CupertinoPicker(
      children: list,
      itemExtent: 38,
      onSelectedItemChanged: (value) {
        setState(() {
          selectedCurrency = currenciesList[value];
          exchangeRate = initExchangeRates();
          getData();
        });
      },
    );
  }

  Widget getPlatformPickerWidget() {
    if (Platform.isAndroid) {
      return getDropDownMenu();
    } else if (Platform.isIOS) {
      return getPicker();
    }
    return getDropDownMenu();
  }

  List<Widget> showExchangeCards() {
    List<Widget> widgets = [];
    for (String crypto in cryptoList) {
      widgets.add(Padding(
        padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
        child: Card(
          color: Colors.lightBlueAccent,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
            child: Text(
              '1 $crypto = ${exchangeRate[crypto]} $selectedCurrency',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ));
    }
    widgets.add(Container(
      height: 150.0,
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 30.0),
      color: Colors.lightBlue,
      child: getPlatformPickerWidget(),
    ));
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: showExchangeCards(),
      ),
    );
  }
}
