import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

List<DropdownMenuItem> getDropdownItems() {
  List<DropdownMenuItem<String>> dropDownItems = [];
  for (String currency in currenciesList) {
    var item = DropdownMenuItem(
        child: Text(
          currency,
          style: TextStyle(fontFamily: 'KiwiMaru-Medium',fontWeight: FontWeight.bold),
        ),
        value: currency);
    dropDownItems.add(item);
  }
  return dropDownItems;
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'INR';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('CRYPTO TRACKER',
                style: TextStyle(
                    fontFamily: 'KiwiMaru-Medium',
                    fontSize: 30.00,
                    fontWeight: FontWeight.bold))),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.red[400],
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'KiwiMaru-Medium',
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.red[400],
            child: DropdownButton<String>(
              value: selectedCurrency,
              items: getDropdownItems(),
              onChanged: (value) {
                setState(() {
                  selectedCurrency = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
