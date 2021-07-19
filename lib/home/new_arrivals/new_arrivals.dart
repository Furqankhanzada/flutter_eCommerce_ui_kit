import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_kit/blocks/products_block.dart';
import 'package:flutter_ecommerce_ui_kit/home/new_arrivals/products.dart';
import 'package:provider/provider.dart';

import '../../localizations.dart';
import 'new_arrivals_placeholder.dart';

class NewArrivals extends StatelessWidget {
  const NewArrivals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductsBlock productBlock = Provider.of<ProductsBlock>(context);
    List<dynamic> newArrivals = productBlock.newArrivals;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 14.0, left: 8.0, right: 8.0),
          child: Text(AppLocalizations.of(context)!.translate('NEW_ARRIVALS'),
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700)),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          height: 240.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: newArrivals.isEmpty
                ? [NewArrivalsPlaceholder()]
                : [NewArrivalProducts()],
          ),
        )
      ],
    );
  }
}
