import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_ecommerce_ui_kit/auth/auth.dart';
import 'package:flutter_ecommerce_ui_kit/blocks/auth_block.dart';
import 'package:flutter_ecommerce_ui_kit/blocks/categories_block.dart';
import 'package:flutter_ecommerce_ui_kit/blocks/products_block.dart';
import 'package:flutter_ecommerce_ui_kit/blocks/cart.dart';
import 'package:flutter_ecommerce_ui_kit/blocks/payment_methods.dart';
import 'package:flutter_ecommerce_ui_kit/blocks/order_details.dart';
import 'package:flutter_ecommerce_ui_kit/cart.dart';
import 'package:flutter_ecommerce_ui_kit/categorise.dart';
import 'package:flutter_ecommerce_ui_kit/home/home.dart';
import 'package:flutter_ecommerce_ui_kit/localizations.dart';
import 'package:flutter_ecommerce_ui_kit/product_detail.dart';
import 'package:flutter_ecommerce_ui_kit/settings.dart';
import 'package:flutter_ecommerce_ui_kit/shop/shop.dart';
import 'package:flutter_ecommerce_ui_kit/checkout.dart';
import 'package:flutter_ecommerce_ui_kit/payment.dart';
import 'package:flutter_ecommerce_ui_kit/wishlist.dart';
import 'package:flutter_ecommerce_ui_kit/confirm_checkout.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final Locale locale = Locale('en');
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthBlock>.value(value: AuthBlock()),
      ChangeNotifierProvider<CategoriesBlock>.value(value: CategoriesBlock()),
      ChangeNotifierProvider<ProductsBlock>.value(value: ProductsBlock()),
  ChangeNotifierProvider<CartBlock>.value(value: CartBlock()),
  ChangeNotifierProvider<PaymentBlock>.value(value: PaymentBlock()),
  ChangeNotifierProvider<OrderBlock>.value(value: OrderBlock())
  ],
    child: MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('en'), Locale('ar')],
      locale: locale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.deepOrange.shade500,
          accentColor: Colors.lightBlue.shade900,
          fontFamily: locale.languageCode == 'ar' ? 'Dubai' : 'Lato'),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => Home(),
        '/auth': (BuildContext context) => Auth(),
        '/shop': (BuildContext context) => Shop(),
        '/categorise': (BuildContext context) => Categorise(),
        '/wishlist': (BuildContext context) => WishList(),
        '/cart': (BuildContext context) => CartList(),
        '/settings': (BuildContext context) => Settings(),
        '/products': (BuildContext context) => Products(),
        '/checkout': (BuildContext context) => Checkout(),
        '/payment': (BuildContext context) => Payment(),
        '/confirm': (BuildContext context) => ConfirmCheckout()
  },
    ),
  ));
}
