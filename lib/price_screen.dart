<<<<<<< HEAD
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
=======
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'package:simple_drawer/simple_drawer.dart';
import 'package:flutter_hamburger_scaffold/flutter_hamburger_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_custom_cards/flutter_custom_cards.dart';

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
          style: TextStyle(
              fontFamily: 'KiwiMaru-Medium', fontWeight: FontWeight.bold),
        ),
        value: currency);
    dropDownItems.add(item);
  }
  return dropDownItems;
}

class _PriceScreenState extends State<PriceScreen> {
  static String selectedCurrency = 'USD';
  static Map<String, String> coinValues = {};
  static bool isAwaiting = false;

  void getData() async {
    isAwaiting = true;
    try {
      var data = await CoinData().getCoinData(selectedCurrency);
      isAwaiting = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(

        future: CoinData().getCoinData(selectedCurrency),
        builder: (context, AsyncSnapshot snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting && isAwaiting == true) {
            return MaterialApp(
                debugShowCheckedModeBanner: false, home: Splash());
          } else {
            return SafeArea(
                child: Container(decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.blueGrey, Colors.black])),
                    child:Scaffold(

              appBar: AppBar(
                backgroundColor: Colors.black54,
              ),
              drawer: Theme(
              data: Theme.of(context).copyWith(
              canvasColor: Colors.black, //This will change the drawer background to blue.
              //other styles
              ),
                child:Drawer(
                child: ListView(children: <Widget>[
                  ListTile(
                    title: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 30.0, horizontal: 0),
                      child: Center(
                        child: Text(
                          'CRYPTO TRACKER',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'KiwiMaru-Medium',
                              fontSize: 30.00),
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'ABOUT',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'KiwiMaru-Medium',
                          fontSize: 20.00),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0),
                  child:Card(
                    color: Colors.blueGrey,


                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: ListTile(
                      title: Text(
                          'A flutter app where you can check the current exchange rates of BTC (Bitcoin) , LTC (Litecoin) and ETH (Ethereum) cryptocurrencies in 21 countries\'\ denominations.', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'KiwiMaru-Medium',
                          fontSize: 20.00,
                          height: 2.0 ,
                      color: Colors.white),

                    ),
                    ),
                  ))
                ]),
              ),),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(60.0, 80.0, 60.0, 0),
                    child: Card(
                      color: Colors.black54,
                      elevation: 10.0,
                        shadowColor:Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 60.0, horizontal: 0.0),
                        child: Text(
                          '1 BTC = ${isAwaiting ? '?' : coinValues['BTC']} $selectedCurrency',
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(60.0, 0.0, 60.0, 0),
                    child: Card(
                      color: Colors.black54,
                      shadowColor:Colors.blue,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 60.0, horizontal: 0.0),
                        child: Text(
                          '1 ETH = ${isAwaiting ? '?' : coinValues['ETH']} $selectedCurrency',
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(60.0, 0.0, 60.0, 0),
                    child: Card(
                      color: Colors.black54,
                      shadowColor:Colors.blue,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 60.0, horizontal: 0.0),
                        child: Text(
                          '1 LTC = ${isAwaiting ? '?' : coinValues['LTC']} $selectedCurrency',
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
                    height: 70.0,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(bottom: 15.0),
                    color: Colors.transparent,
                    child: DropdownButton<String>(
                      dropdownColor: Colors.black54,
                      value: selectedCurrency,
                      items: getDropdownItems(),
                      onChanged: (value) {
                        setState(() {
                          selectedCurrency = value;
                          getData();
                        });
                      },
                    ),
                  ),
                ],
              ),
                )));
          }
        });
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Icon(
          Icons.monetization_on_rounded,
          color: Colors.black54,
          size: MediaQuery.of(context).size.width * 0.785,
        ),
      ),
    );
  }
}
>>>>>>> e3532335dae7a6063db9f20a10fbf793621fca43
