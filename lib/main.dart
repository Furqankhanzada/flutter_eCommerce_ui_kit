import 'package:flutter/material.dart';
import 'package:flutter_scaffold/blocks/auth_block.dart';
import 'package:provider/provider.dart';
import 'auth/auth.dart';
import 'home/home.dart';
import 'shop/shop.dart';
import 'categorise.dart';
import 'wishlist.dart';
import 'cart.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthBlock>.value(value: AuthBlock())
        ],
        child: MaterialApp(
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
            '/wishlist': (BuildContext context) => WishList(),
            '/cart': (BuildContext context) => CartList()
          },
        ),
      )
  );
}

