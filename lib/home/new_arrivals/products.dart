import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_kit/blocks/products_block.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:provider/provider.dart';


class NewArrivalProducts extends StatelessWidget {
  const NewArrivalProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: getProducts(context)
    );
  }

  Widget getProducts(BuildContext context) {
    final ProductsBlock productBlock = Provider.of<ProductsBlock>(context);
    List<dynamic> newArrivals = productBlock.newArrivals;

    List<Widget> list = newArrivals.map((product) => Product(product: product)).toList();
    return Row(children: list);
  }
}

class Product extends StatelessWidget {
  final product;
  Product({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductsBlock productBlock = Provider.of<ProductsBlock>(context);
    var unescape = HtmlUnescape();
    var currency = unescape.convert(productBlock.currency);
    return Container(
      width: 140.0,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
                context, '/products',
                arguments: product);
          },
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 160,
                child: Hero(
                  tag: product["thumbnail"] ?? '',
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: product["thumbnail"] ?? '',
                    placeholder: (context,
                        url) =>
                        Center(
                            child:
                            CircularProgressIndicator()),
                    errorWidget: (context,
                        url, error) =>
                    new Icon(Icons.error),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  product['name'] ?? '',
                  overflow:
                  TextOverflow.ellipsis,
                  style:
                  TextStyle(fontSize: 14),
                ),
                subtitle: Text(
                    "$currency 200",
                    style: TextStyle(
                        color:
                        Theme.of(context)
                            .accentColor,
                        fontWeight:
                        FontWeight.w700)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

