import 'package:flutter/material.dart';
import 'auth/auth.dart';
import 'home/home.dart';
import 'shop/shop.dart';
import 'categorise.dart';
import 'wishlist.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.deepOrange[500],
            accentColor: Colors.lightBlue[900],
            fontFamily: 'Lato'
        ),
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => Home(),
          '/auth': (BuildContext context) => Auth(),
          '/shop': (BuildContext context) => Shop(),
          '/categorise': (BuildContext context) => Categorise(),
          '/wishlist': (BuildContext context) => WishList()
        },
      )
  );
}

