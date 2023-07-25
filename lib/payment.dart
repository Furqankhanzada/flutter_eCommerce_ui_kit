import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_kit/blocks/payment_methods.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ecommerce_ui_kit/models/user.dart';
import 'package:flutter_ecommerce_ui_kit/blocks/order_details.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}
class _PaymentState extends State<Payment> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  final _formKey = GlobalKey<FormState>();
  final UserCredential userCredential = UserCredential(usernameOrEmail: '', password: '');

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      // Here you can write your code
      final PaymentBlock paymentBlock = Provider.of<PaymentBlock>(context);
      paymentBlock.getPayment();
    });
  }
  Widget build(BuildContext context) {
    final PaymentBlock paymentBlock = Provider.of<PaymentBlock>(context);
    final OrderBlock orderBlock = Provider.of<OrderBlock>(context);
    List<dynamic> paymentMethods = paymentBlock.payment;
    return Scaffold(
        appBar: AppBar(
          title: Text("Payment Methods"),
        ),
        body: SafeArea(
          top: false,
          left: false,
          right: false,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
            children: paymentMethods.length > 0 ? paymentMethods.map((payment) {
//                            i["thumbnail"] = imgList[newArrivals.indexOf(i)];
//                            print(i["thumbnail"]);
              return Builder(
                builder: (BuildContext context) {
                  return Center(
                    child: Container(
                      width: 240.0,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).primaryColor,
                            textStyle: TextStyle(
                              color: Colors.white
                            ),
                            ),

                            child: Text(payment['title'],
                                overflow: TextOverflow.ellipsis),
                            onPressed: () {
                              orderBlock.setPaymentMethod(payment);
                              Navigator.pushNamed(context, '/confirm');
                            }),
                      ),
                    ),
                  );
                },
              );
            }).toList() : []
          )
        ));
  }
}
