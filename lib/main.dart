import 'package:flutter/material.dart';
import 'package:flutter_scaffold/auth/auth.dart';
import 'package:flutter_scaffold/blocks/auth_block.dart';
import 'package:flutter_scaffold/cart.dart';
import 'package:flutter_scaffold/settings.dart';
import 'package:flutter_scaffold/product_detail.dart';
import 'package:flutter_scaffold/categorise.dart';
import 'package:flutter_scaffold/home/home.dart';
import 'package:flutter_scaffold/shop/shop.dart';
import 'package:flutter_scaffold/wishlist.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider<AuthBlock>.value(value: AuthBlock())],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.deepOrange[500],
          accentColor: Colors.lightBlue[900],
          fontFamily: 'Lato'),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => Home(),
        '/auth': (BuildContext context) => Auth(),
        '/shop': (BuildContext context) => Shop(),
        '/categorise': (BuildContext context) => Categorise(),
        '/wishlist': (BuildContext context) => WishList(),
        '/cart': (BuildContext context) => CartList(),
        '/settings': (BuildContext context) => Settings(),
        '/products': (BuildContext context) => Product()
      },
    ),
  ));
}
