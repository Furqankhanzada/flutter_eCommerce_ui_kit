import 'package:flutter/material.dart';

class ShopSearch extends StatefulWidget {
  @override
  _ShopSearchState createState() => _ShopSearchState();
}

class _ShopSearchState extends State<ShopSearch> {
  @override
  RangeValues _values = RangeValues(0.3, 0.7);
  Widget build(BuildContext context) {
    return Container(
      height: 425,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
                blurRadius: 2, color: Colors.black12, spreadRadius: 3)
          ]),
      child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text('Select Price Range', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            RangeSlider(
              values: _values,
              onChanged: (RangeValues values) {
                setState(() {
                  _values = values;
                });
              },
            ),
          ]
      ),
    );
  }
}
