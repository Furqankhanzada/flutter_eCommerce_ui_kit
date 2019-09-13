import 'package:flutter/material.dart';

class ShopSearch extends StatefulWidget {
  @override
  _ShopSearchState createState() => _ShopSearchState();
}

class _ShopSearchState extends State<ShopSearch> {
  String dropdownValue = 'One';
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
            Container(
              margin: new EdgeInsetsDirectional.only(bottom: 15.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: dropdownValue,
                  icon: Icon(Icons.keyboard_arrow_down),
                  style: TextStyle(
                      color: Colors.black
                  ),
                  underline: Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['One', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  })
                      .toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                  'Select Price Range', style: TextStyle(fontWeight: FontWeight.bold)
              ),
            ),
            RangeSlider(
              values: _values,
              onChanged: (RangeValues values) {
                setState(() {
                  _values = values;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 120,
                    height: 45.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Theme.of(context).accentColor),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('USD 0', style: TextStyle(color: Colors.white)),
                    )
                  ),
                  Text('to', style: TextStyle(fontSize: 16, color: Colors.black),),
                  Container(
                      width: 120,
                      height: 45.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Theme.of(context).accentColor),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('USD 5000', style: TextStyle(color: Colors.white)),
                      )
                  ),
                ],
              ),
            )
          ],
      ),
    );
  }
}
