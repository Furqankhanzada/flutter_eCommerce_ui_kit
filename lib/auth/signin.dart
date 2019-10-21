import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_scaffold/blocks/auth_block.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter Username Or Email',
                    labelText: 'Email',
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Consumer<AuthBlock>(
                    builder: (context, auth, child) {
                      return RaisedButton(
                        color: Colors.deepOrange,
                        textColor: Colors.white,
                        child: Text(auth.loading ? 'Loading...' : 'Sign In'),
                        onPressed: () {
                          auth.loading = true;
                          final t = Timer(Duration(seconds: 3), () {
                            auth.loading = false;
                          });
                        },
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
