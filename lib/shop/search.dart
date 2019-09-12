import 'package:flutter/material.dart';

class ShopSearch extends StatefulWidget {
  @override
  _ShopSearchState createState() => _ShopSearchState();
}

class _ShopSearchState extends State<ShopSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 425,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
                blurRadius: 3, color: Colors.grey[300], spreadRadius: 1)
          ]),
      child: Column(
          children: [
            Text('sadas')
          ]
      ),
    );
  }
}
