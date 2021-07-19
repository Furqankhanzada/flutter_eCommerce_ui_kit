import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ecommerce_ui_kit/blocks/cart.dart';
import 'package:flutter_ecommerce_ui_kit/blocks/order_details.dart';
import 'package:flutter_ecommerce_ui_kit/blocks/auth_block.dart';

class ConfirmCheckout extends StatefulWidget {
  @override
  _ConfirmCheckoutState createState() => _ConfirmCheckoutState();
}

class _ConfirmCheckoutState extends State<ConfirmCheckout> {
  late bool loading;
  @override
  void initState() {
    super.initState();
    setState(() {
      loading = false;
    });
  }

  Widget build(BuildContext context) {
    AuthBlock auth = Provider.of<AuthBlock>(context);
    final CartBlock cartBlock = Provider.of<CartBlock>(context);
    List<dynamic> cartItems = cartBlock.cartItems;
    var total = 0;
    cartItems
        .forEach((element) => total = total + int.parse(element["sale_price"]));
    final OrderBlock orderBlock = Provider.of<OrderBlock>(context);
    final order = orderBlock.orderGetter;
    List<dynamic> bankDetails = orderBlock.bankDetailsGetter;
    final paymentMethod = orderBlock.paymentGetter;
    final isLoggedIn = auth.isLoggedIn;
    print("adasdasdasdasd $bankDetails");
    void placeOrder() async {
      if (!isLoggedIn) {
        Navigator.pushNamed(context, '/auth');
      } else {
        setState(() {
          loading = true;
        });
        final response = await orderBlock.placeOrder(cartItems);
        if (response == 200) {
          setState(() {
            loading = false;
          });
          cartBlock.emptyCart();
          Navigator.pushNamed(context, '/');
        } else {
          setState(() {
            loading = false;
          });
        }
      }
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Checkout'),
        ),
        body: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return Dismissible(
                      // Each Dismissible must contain a Key. Keys allow Flutter to
                      // uniquely identify widgets.
                      key: Key(UniqueKey().toString()),
                      // Provide a function that tells the app
                      // what to do after an item has been swiped away.
                      onDismissed: (direction) {
                        if (direction == DismissDirection.endToStart) {
                          // Then show a snackbar.
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(item['name'] + " dismissed"),
                              duration: Duration(seconds: 1)));
                        } else {
                          // Then show a snackbar.
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(item['name'] + " added to carts"),
                              duration: Duration(seconds: 1)));
                        }

                        // Remove the item from the data source.
                        cartBlock.addToCart(item);
                      },
                      // Show a red background as the item is swiped away.
                      background: Container(
                        decoration: BoxDecoration(color: Colors.red),
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Icon(Icons.delete, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      secondaryBackground: Container(
                        decoration: BoxDecoration(color: Colors.red),
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Icon(Icons.delete, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          print('Card tapped.');
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Divider(
                              height: 0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0),
                              child: ListTile(
                                  trailing: Text('\$ ${item['price']}'),
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(5.0),
                                    child: Container(
                                      decoration:
                                          BoxDecoration(color: Colors.blue),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: item['thumbnail'],
                                        placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            new Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    item['name'],
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 2.0, bottom: 1),
                                            child: Text('in stock',
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .accentColor,
                                                  fontWeight: FontWeight.w700,
                                                )),
                                          )
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Container(
                child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      "SHIPPING ADDRESS",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(order.address, style: TextStyle(fontSize: 14)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      "PAYMENT METHOD",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: paymentMethod == 'Direct bank transfer'
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(paymentMethod,
                                  style: TextStyle(fontSize: 14)),
                              InkWell(
                                child: Text('View Details',
                                    style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.w700,
                                    )),
                                onTap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children:
                                                bankDetails.map((account) {
                                              return Builder(
                                                builder:
                                                    (BuildContext context) {
                                                  return account['account_name'] !=
                                                              '' &&
                                                          account['account_number'] !=
                                                              ''
                                                      ? Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10,
                                                                  right: 10, top: 10),
                                                          child: Container(
                                                            child: Column(
                                                              children: <
                                                                  Widget>[
                                                                   Padding(
                                                                    padding: const EdgeInsets
                                                                            .all(10.0),
                                                                    child: Text('Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order will not be shipped until the funds have cleared in our account.', textAlign: TextAlign.justify)),                                                                Padding(
                                                                    padding: const EdgeInsets
                                                                            .all(10.0),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: <
                                                                          Widget>[
                                                                        Text(
                                                                            'ACCOUNT NAME',
                                                                            style:
                                                                                TextStyle(
                                                                              color: Theme.of(context).primaryColor,
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.w600,
                                                                            )),
                                                                        Text(
                                                                            account[
                                                                                'account_name'],
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 16,
                                                                            ))
                                                                      ],
                                                                    )),
                                                               Padding(
                                                                    padding: const EdgeInsets
                                                                            .all(10.0),
                                                                    child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: <
                                                                      Widget>[
                                                                    Text(
                                                                        'ACCOUNT NUMBER',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Theme.of(context).primaryColor,
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        )),
                                                                    Text(
                                                                        account[
                                                                            'account_number'],
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              16,
                                                                        ))
                                                                  ],
                                                                )),
                                                               Padding(
                                                                    padding: const EdgeInsets
                                                                            .all(10.0),
                                                                    child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: <
                                                                      Widget>[
                                                                    Text(
                                                                        'BANK NAME',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Theme.of(context).primaryColor,
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        )),
                                                                    Text(
                                                                        account[
                                                                            'bank_name'],
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              16,
                                                                        ))
                                                                  ],
                                                                )),
                                                               Padding(
                                                                    padding: const EdgeInsets
                                                                            .all(10.0),
                                                                    child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: <
                                                                      Widget>[
                                                                    Text('IBAN',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Theme.of(context).primaryColor,
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        )),
                                                                    Text(
                                                                        account[
                                                                            'iban'],
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              16,
                                                                        ))
                                                                  ],
                                                                ))
                                                              ],
                                                            ),
                                                          ))
                                                      : Divider();
                                                },
                                              );
                                            }).toList());
                                      });
                                },
                              )
                            ],
                          )
                        : Text(paymentMethod, style: TextStyle(fontSize: 14)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          "TOTAL",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        )),
                        Text("\$$total",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text("Shipping",
                                style: TextStyle(fontSize: 14))),
                        Text("\$2.00",
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                      ],
                    ),
                  )
                ],
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20, top: 50, bottom: 10),
              child: ButtonTheme(
                buttonColor: Theme.of(context).primaryColor,
                minWidth: double.infinity,
                height: 40.0,
                child: RaisedButton(
                  onPressed: loading == false ? placeOrder : null,
                  child: Text(
                    "PLACE ORDER",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
