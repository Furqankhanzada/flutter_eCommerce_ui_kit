import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  var i;
  Product(this.i);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: SafeArea(
          top: false,
          left: false,
          right: false,
          child: SizedBox(
            width: double.infinity,
            height: 260,
            child: Hero(
              tag: i,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: i,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => new Icon(Icons.error),
              ),
            ),
          )),
    );
  }
}
