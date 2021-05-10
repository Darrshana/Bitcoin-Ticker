<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'price_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.red[400],
          scaffoldBackgroundColor: Colors.grey[850]),
      home: PriceScreen(),

    );
  }
}
=======
import 'package:flutter/material.dart';
import 'price_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.blueGrey,
          scaffoldBackgroundColor: Colors.transparent,),
      home: PriceScreen(),

    );
  }
}
>>>>>>> e3532335dae7a6063db9f20a10fbf793621fca43
