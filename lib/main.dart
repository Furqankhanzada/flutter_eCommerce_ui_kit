import 'package:flutter/material.dart';
import 'auth/auth.dart';
import 'home/home.dart';
import 'products.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.red,
          accentColor: Colors.red
        ),
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => Home(),
          '/auth': (BuildContext context) => Auth(),
          '/products': (BuildContext context) => Products()
        },
      )
  );
}

