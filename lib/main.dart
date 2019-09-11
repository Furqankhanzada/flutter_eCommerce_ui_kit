import 'package:flutter/material.dart';
import 'auth/auth.dart';
import 'home/home.dart';
import 'products.dart';
import 'categorise.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.deepOrange[500],
          accentColor: Colors.lightBlue[900]
        ),
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => Home(),
          '/auth': (BuildContext context) => Auth(),
          '/products': (BuildContext context) => Products(),
          '/categorise': (BuildContext context) => Categorise()
        },
      )
  );
}

