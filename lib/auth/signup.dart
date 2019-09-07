import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Username';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Username',
                    labelText: 'Username',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Email Address';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Email',
                    labelText: 'Email',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter Password';
                      }
                      return null;
                    },
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    labelText: 'Password',
                  ),
                  obscureText: true
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Confirm Password';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Enter Same Password',
                  labelText: 'Confirm Password',
                ),
                obscureText: true,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    color: Colors.deepOrange,
                    textColor: Colors.white,
                    child: Text('Sign Up'),
                    onPressed: (){
                      if (_formKey.currentState.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                      }
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
