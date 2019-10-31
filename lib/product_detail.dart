import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
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
              tag: args,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: args,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => new Icon(Icons.error),
              ),
            ),
          )),
    );
  }
}
