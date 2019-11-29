import 'package:flutter/material.dart';
import 'package:flutter_scaffold/blocks/order_details.dart';
import 'package:flutter_scaffold/localizations.dart';
import 'package:flutter_scaffold/models/order.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  final _formKey = GlobalKey<FormState>();
  final Order order = Order();

  @override
  Widget build(BuildContext context) {
    final OrderBlock orderBlock = Provider.of<OrderBlock>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).translate('CHECKOUT')),
        ),
        body: SafeArea(
          top: false,
          left: false,
          right: false,
          child: new Stack(alignment: Alignment.bottomCenter, children: [
            SingleChildScrollView(
              child:
              Form(
                  key: _formKey,

                  child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, bottom: 80),
              child: Column(children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter First Name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      print(value);
                      order.firstname = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter First Name',
                    labelText: AppLocalizations.of(context)
                        .translate('FIRST_NAME'),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Last Name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      order.lastname = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Last Name',
                    labelText:
                        AppLocalizations.of(context).translate('LAST_NAME'),
                  ),
                  obscureText: true,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      order.email = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Email',
                    labelText:
                        AppLocalizations.of(context).translate('EMAIL'),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Username';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      order.username = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Username',
                    labelText:
                        AppLocalizations.of(context).translate('USERNAME'),
                  ),
                  obscureText: true,
                ),
                DropdownButton<String>(
                  isExpanded: true,
                  hint: Text('Country'),
                  items: <String>['A', 'B', 'C', 'D'].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),
                DropdownButton<String>(
                  isExpanded: true,
                  hint: Text('State'),
                  items: <String>['A', 'B', 'C', 'D'].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter City Name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      order.city = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter City Name',
                    labelText:
                        AppLocalizations.of(context).translate('CITY'),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Phone Number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      order.phone = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Phone Number',
                    labelText: AppLocalizations.of(context)
                        .translate('PHONE_NUMBER'),
                  ),
                  obscureText: true,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Street Address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      order.address = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Street Address',
                    labelText: AppLocalizations.of(context)
                        .translate('STREET_ADDRESS'),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Postal Code';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      order.postalCode = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Postal Code',
                    labelText: AppLocalizations.of(context)
                        .translate('POSTAL_CODE'),
                  ),
                  obscureText: true,
                ),
              ]),
            ))
            ),
            new Container(height: 70.0, color: Colors.white,
              child:  Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          top: 8.0, left: 20.0, right: 8.0),
                      child: Text("Cancel",
                        style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.w700))
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 20.0, top: 8.0, left: 8.0),
                      child: RaisedButton(
                          color: Theme.of(context).primaryColor,
                          child: Text('Proceed',
                              style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              orderBlock.setOrderDetails(order);
                              Navigator.pushNamed(context, '/payment');

                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
//                              auth.register(user);
                            }
                          }),
                    )
                  ],
                ),
              )
            )
          ]),
        ));
  }
}
