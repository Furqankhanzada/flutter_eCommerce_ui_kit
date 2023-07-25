import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ecommerce_ui_kit/models/user.dart';
import 'package:flutter_ecommerce_ui_kit/blocks/auth_block.dart';
import 'package:flutter_ecommerce_ui_kit/localizations.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final User user = User(password: '', username: '', email: '');
  late String confirmPassword;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Username';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          user.username = value!;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter Username',
                        labelText: AppLocalizations.of(context)!
                            .translate('USERNAME'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Email Address';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          user.email = value!;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter Email',
                        labelText: AppLocalizations.of(context)!
                            .translate('EMAIL'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          setState(() {
                            user.password = value!;
                          });
                        },
                        onChanged: (text) {
                          user.password = text;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter Password',
                          labelText: AppLocalizations.of(context)!
                              .translate('PASSWORD'),
                        ),
                        obscureText: true),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Confirm Password';
                      } else if (user.password != confirmPassword) {
                        return 'Password fields dont match';
                      }
                      return null;
                    },
                    onChanged: (text) {
                      confirmPassword = text;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Same Password',
                      labelText: AppLocalizations.of(context)!
                          .translate('CONFIRM_PASSWORD'),
                    ),
                    obscureText: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Consumer<AuthBlock>(builder:
                          (BuildContext context, AuthBlock auth, Widget? child) {
                        return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).primaryColor,
                            textStyle: TextStyle(
                              color: Colors.white
                            ),
                            ),
                          child: auth.loading && auth.loadingType == 'register' ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ) : Text(AppLocalizations.of(context)!
                                .translate("CREATE_ACCOUNT")),
                          onPressed: () {
                            if (_formKey.currentState!.validate() && !auth.loading) {
                              _formKey.currentState!.save();
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              auth.register(user);
                            }
                          },
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }
}
