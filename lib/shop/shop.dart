import 'package:flutter/material.dart';

import 'package:flutter_ecommerce_ui_kit/blocks/products_block.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ecommerce_ui_kit/localizations.dart';
import 'package:html_unescape/html_unescape.dart';
import 'search.dart';

class Shop extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () {
// Here you can write your code
      final ProductsBlock productBlock = Provider.of<ProductsBlock>(context);
      productBlock.getProducts();
    });
  }

  Widget build(BuildContext context) {
    final ProductsBlock productBlock = Provider.of<ProductsBlock>(context);
    final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
        new GlobalKey<RefreshIndicatorState>();
    final GlobalKey<RefreshIndicatorState> _refreshIndicatorKeyGrid =
        new GlobalKey<RefreshIndicatorState>();
    List<dynamic> products = productBlock.products;
    var unescape = new HtmlUnescape();
    var currency = unescape.convert(productBlock.currency);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {
                scaffoldKey.currentState!
                    .showBottomSheet((context) => ShopSearch());
              },
            )
          ],
          title: Text(AppLocalizations.of(context)!
              .translate('SHOP_BY_CATEGORY')),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return DefaultTabController(
                length: 2,
                child: Column(
                  children: <Widget>[
                    Container(
                      constraints: BoxConstraints(maxHeight: 150.0),
                      child: Material(
                        color: Theme.of(context).accentColor,
                        child: TabBar(
                          indicatorColor: Colors.blue,
                          tabs: [
                            Tab(icon: Icon(Icons.view_list)),
                            Tab(icon: Icon(Icons.grid_on)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ));
          },
        ),
      ),
    );
  }
}
