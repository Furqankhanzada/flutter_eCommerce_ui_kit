import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Product extends StatefulWidget {
  @override
  _ProductDetail createState() => _ProductDetail();
}

class _ProductDetail extends State<Product> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: SafeArea(
          top: false,
          left: false,
          right: false,

          child: Hero(
            tag: 'products',
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage("https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80"),
                ),
              ),
            ),
          )),
    );
  }
}