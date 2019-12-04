import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_scaffold/localizations.dart';
import 'package:flutter_scaffold/blocks/cart.dart';
import 'package:provider/provider.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:flutter_scaffold/blocks/products_block.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartBlock cartBlock = Provider.of<CartBlock>(context);
    final ProductsBlock productBlock = Provider.of<ProductsBlock>(context);
    Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    List<dynamic> addedToCart = cartBlock.cartItems.where((item) => item["id"] == args["id"]).toList();
    final cartLength = addedToCart.length;
    var unescape = new HtmlUnescape();
    var currency = unescape.convert(productBlock.currency);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)
            .translate('PRODUCT_DETAILS')),
      ),
      body: SafeArea(
        top: false,
        left: false,
        right: false,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: 260,
                child: Hero(
                  tag: args['thumbnail'],
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: args['thumbnail'],
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment(-1.0, -1.0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Text(
                          args['name'],
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Text(
                                  '$currency ' + args["price"],
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Text('$currency ' + args['regular_price'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      decoration: TextDecoration.lineThrough)),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              SmoothStarRating(
                                  allowHalfRating: false,
                                  onRatingChanged: (v) {},
                                  starCount: 5,
                                  rating: args['review_count'].toDouble(),
                                  size: 20.0,
                                  color: Colors.amber,
                                  borderColor: Colors.amber,
                                  spacing: -0.8),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text('(0.00)',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                            alignment: Alignment(-1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                AppLocalizations.of(context)
                                    .translate('DESCRIPTION'),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                            )),
                        Container(
                            alignment: Alignment(-1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              child: Text(
                                args['description'],
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            )
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(minWidth: double.infinity),
                          child: new RaisedButton(
                              color: Theme.of(context).primaryColor,
                            onPressed: () {
                              cartBlock.addToCart(args);
                            },
                            child: Text(cartLength == 0 ? "ADD TO CART" : 'REMOVE FROM CART',
                                style: TextStyle(color: Colors.white)
                            ),
                          ),
                        )

                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
