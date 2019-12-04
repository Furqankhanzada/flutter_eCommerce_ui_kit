import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_scaffold/blocks/products_block.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_scaffold/localizations.dart';
import 'package:html_unescape/html_unescape.dart';
import 'search.dart';

class Shop extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
//  final List<Map<dynamic, dynamic>> products = [
//    {
//      'name': 'IPhone',
//      'rating': 3.0,
//      'image':
//          'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'
//    },
//    {
//      'name': 'IPhone X 2',
//      'rating': 3.0,
//      'image':
//          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'
//    },
//    {
//      'name': 'IPhone 11',
//      'rating': 4.0,
//      'image':
//          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
//    },
//    {
//      'name': 'IPhone 11',
//      'rating': 4.0,
//      'image':
//          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
//    },
//    {
//      'name': 'IPhone 11',
//      'rating': 4.0,
//      'image':
//          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
//    },
//    {
//      'name': 'IPhone 11',
//      'rating': 4.0,
//      'image':
//          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
//    },
//    {
//      'name': 'IPhone 11',
//      'rating': 4.0,
//      'image':
//          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
//    },
//    {
//      'name': 'IPhone 11',
//      'rating': 4.0,
//      'image':
//          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
//    },
//    {
//      'name': 'IPhone 11',
//      'rating': 4.0,
//      'image':
//          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'
//    },
//    {
//      'name': 'IPhone 12',
//      'rating': 5.0,
//      'image':
//          'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80'
//    },
//  ];
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    print("initStateRunning");
    Future.delayed(const Duration(milliseconds: 1000), () {
// Here you can write your code
      final ProductsBlock productBlock = Provider.of<ProductsBlock>(context);
      productBlock.getProducts();
    });
  }

  Widget build(BuildContext context) {
    final ProductsBlock productBlock = Provider.of<ProductsBlock>(context);
    final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
        new GlobalKey<RefreshIndicatorState>();
    final GlobalKey<RefreshIndicatorState> _refreshIndicatorKeyGrid =
        new GlobalKey<RefreshIndicatorState>();
    Future<Null> _refresh() {
      productBlock.getProducts();
    }
    List<dynamic> products = productBlock.products;
    var unescape = new HtmlUnescape();
    var currency = unescape.convert(productBlock.currency);
    print("------products $products");
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {
                scaffoldKey.currentState
                    .showBottomSheet((context) => ShopSearch());
              },
            )
          ],
          title: Text(AppLocalizations.of(context)
              .translate('SHOP_BY_CATEGORY')),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return DefaultTabController(
                length: 2,
                child: Column(
                  children: <Widget>[
                    Container(
                      constraints: BoxConstraints(maxHeight: 150.0),
                      child: Material(
                        color: Theme.of(context).accentColor,
                        child: TabBar(
                          indicatorColor: Colors.blue,
                          tabs: [
                            Tab(icon: Icon(Icons.view_list)),
                            Tab(icon: Icon(Icons.grid_on)),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          RefreshIndicator(
                            key: _refreshIndicatorKey,
                            onRefresh: _refresh,
                            child: ListView(
                              children: products.length == 0
                                  ? [1, 2, 3, 4].map((product) {
                                      return Builder(
                                        builder: (BuildContext context) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Divider(
                                                height: 0,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0, bottom: 10.0),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Shimmer.fromColors(
                                                      baseColor:
                                                          Colors.grey[300],
                                                      highlightColor:
                                                          Colors.grey[100],
                                                      enabled: true,
                                                      child: Column(
                                                        children: [0]
                                                            .map((_) => Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      bottom:
                                                                          8.0,
                                                                      left:
                                                                          10.0),
                                                                  child: Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            60,
                                                                        height:
                                                                            60,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ))
                                                            .toList(),
                                                      ),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                      Shimmer.fromColors(
                                                          baseColor:
                                                              Colors.grey[300],
                                                          highlightColor:
                                                              Colors.grey[100],
                                                          enabled: true,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 10.0,
                                                                    right: 5.0,
                                                                    top: 5.0),
                                                            child: Container(
                                                                  width: MediaQuery.of(context).size.width - 90,
                                                                  height: 10,
                                                                  color: Colors
                                                                      .white,
                                                                ),

                                                          )
                                                      ),
                                                      Shimmer.fromColors(
                                                          baseColor:
                                                              Colors.grey[300],
                                                          highlightColor:
                                                              Colors.grey[100],
                                                          enabled: true,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 10.0,
                                                                    right: 5.0,
                                                                    top: 10.0),
                                                            child: Container(
                                                                  width: MediaQuery.of(context).size.width - 180,
                                                                  height: 10,
                                                                  color: Colors
                                                                      .white,
                                                                )
                                                          )
                                                      ),
                                                      Shimmer.fromColors(
                                                        baseColor:
                                                            Colors.grey[300],
                                                        highlightColor:
                                                            Colors.grey[100],
                                                        enabled: true,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 10.0,
                                                                  right: 5.0,
                                                                  top: 10.0),
                                                          child: Container(
                                                                width: MediaQuery.of(context).size.width - 270,
                                                                height: 10,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                        ),
                                                      )
                                                    ])
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }).toList()
                                  : products.map((product) {
                                      return Builder(
                                        builder: (BuildContext context) {
                                          return InkWell(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, '/products',
                                                  arguments: product);
                                            },
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Divider(
                                                  height: 0,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10.0,
                                                          bottom: 10.0),
                                                  child: ListTile(
                                                    trailing: Icon(
                                                        Icons.navigate_next),
                                                    leading: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Colors
                                                                    .blue),
                                                        child:
                                                            CachedNetworkImage(
                                                          fit: BoxFit.cover,
                                                          imageUrl:
                                                              'https://raw.githubusercontent.com/peng8350/flutter_pulltorefresh/master/arts/qr_code.png',
                                                          placeholder: (context,
                                                                  url) =>
                                                              Center(
                                                                  child:
                                                                      CircularProgressIndicator()),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              new Icon(
                                                                  Icons.error),
                                                        ),
                                                      ),
                                                    ),
                                                    title: Text(
                                                      product['name'],
                                                      style: TextStyle(
                                                          fontSize: 14),
                                                    ),
                                                    subtitle: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Row(
                                                          children: <Widget>[
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 2.0,
                                                                      bottom:
                                                                          1),
                                                              child: Text(
                                                                  '$currency ' +
                                                                      product[
                                                                          'price'],
                                                                  style:
                                                                      TextStyle(
                                                                    color: Theme.of(
                                                                            context)
                                                                        .accentColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  )),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          6.0),
                                                              child: Text('($currency)' + product['regular_price'],
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .italic,
                                                                      color: Colors
                                                                          .grey,
                                                                      decoration:
                                                                          TextDecoration
                                                                              .lineThrough)),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          children: <Widget>[
                                                            SmoothStarRating(
                                                                allowHalfRating:
                                                                    false,
                                                                onRatingChanged:
                                                                    (v) {
                                                                  product[
                                                                      'review_count'] = v;
                                                                  setState(
                                                                      () {});
                                                                },
                                                                starCount: 5,
                                                                rating: product[
                                                                        'review_count']
                                                                    .toDouble(),
                                                                size: 16.0,
                                                                color: Colors
                                                                    .amber,
                                                                borderColor:
                                                                    Colors
                                                                        .amber,
                                                                spacing: 0.0),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          6.0),
                                                              child: Text('(4)',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      color: Theme.of(
                                                                              context)
                                                                          .primaryColor)),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    }).toList(),
                            ),
                          ),
                          RefreshIndicator(
                            key: _refreshIndicatorKeyGrid,
                            onRefresh: _refresh,
                            child: GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 2,
                              childAspectRatio: 0.7,
                              padding: EdgeInsets.only(
                                  top: 8, left: 10, bottom: 0),
                              children: products.length == 0 ?
                              List.generate(4, (index) {
                                return Container(
                                  child: Column(

                                        children: <Widget>[
                                          SizedBox(
                                            height: (MediaQuery.of(context)
                                                .size
                                                .width /
                                                2 -
                                                5),
                                            width: double.infinity,
                                            child: Shimmer.fromColors(
                                              baseColor:
                                              Colors.grey[300],
                                              highlightColor:
                                              Colors.grey[100],
                                              enabled: true,
                                              child: Padding(
                                                  padding: const EdgeInsets
                                                      .only(
                                                      bottom:
                                                      8.0,
                                                      right:
                                                      10.0),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      Container(
                                                        width:
                                                        MediaQuery.of(context).size.width,
                                                        height:
                                                        MediaQuery.of(context).size.height,
                                                        color: Colors
                                                            .white,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                            ),
                                          ),
                                          Shimmer.fromColors(
                                            baseColor:
                                            Colors.grey[300],
                                            highlightColor:
                                            Colors.grey[100],
                                            enabled: true,
                                            child: Padding(
                                              padding: const EdgeInsets
                                                  .only(
                                                  right:
                                                  10.0),
                                              child: Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Container(
                                                    width:
                                                    MediaQuery.of(context).size.width,
                                                    height: 10,
                                                    color: Colors
                                                        .white,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 5.0, right:
                                            10.0),
                                            child: Shimmer.fromColors(
                                              baseColor:
                                              Colors.grey[300],
                                              highlightColor:
                                              Colors.grey[100],
                                              enabled: true,
                                              child: Row(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Container(
                                                    width: 60,
                                                    height: 10,
                                                    color: Colors
                                                        .white,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),

                                );
                              })
                                  : List.generate(products.length, (index) {
                                return Container(
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/products',
                                            arguments: products[index]);
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(
                                            height: (MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2 -
                                                10),
                                            width: double.infinity,
                                            child: CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              imageUrl:
                                                  'https://raw.githubusercontent.com/peng8350/flutter_pulltorefresh/master/arts/qr_code.png',
                                              placeholder: (context, url) => Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      new Icon(Icons.error),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 5.0),
                                            child: ListTile(
                                              title: Text(
                                                products[index]['name'],
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              subtitle: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Row(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 2.0,
                                                                bottom: 1),
                                                        child: Text(
                                                            '$currency' +
                                                                products[index][
                                                                    'price'],
                                                            style: TextStyle(
                                                              color: Theme.of(
                                                                      context)
                                                                  .accentColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            )),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 6.0),
                                                        child: Text(products[index][
                                                                    'regular_price'],
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                                color:
                                                                    Colors.grey,
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough)),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      SmoothStarRating(
                                                          allowHalfRating:
                                                              false,
                                                          onRatingChanged: (v) {
                                                            products[index][
                                                                'review_count'] = v;
                                                            setState(() {});
                                                          },
                                                          starCount: 5,
                                                          rating: products[
                                                                      index][
                                                                  'review_count']
                                                              .toDouble(),
                                                          size: 16.0,
                                                          color: Colors.amber,
                                                          borderColor:
                                                              Colors.amber,
                                                          spacing: 0.0),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 6.0),
                                                        child: Text('(4)',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColor)),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ));
          },
        ),
//        body: DefaultTabController(
//            length: 2,
//            child: Column(
//              children: <Widget>[
//                Container(
//                  constraints: BoxConstraints(maxHeight: 150.0),
//                  child: Material(
//                    color: Theme.of(context).accentColor,
//                    child: TabBar(
//                      indicatorColor: Colors.blue,
//                      tabs: [
//                        Tab(icon: Icon(Icons.view_list)),
//                        Tab(icon: Icon(Icons.grid_on)),
//                      ],
//                    ),
//                  ),
//                ),
//                Expanded(
//                  child: TabBarView(
//                    children: [
//                      Container(
//                        child: ListView(
//                          children: products.map((product) {
//                            return Builder(
//                              builder: (BuildContext context) {
//                                return  InkWell(
//                                  onTap: () {
//                                    print('Card tapped.');
//                                  },
//                                  child: Column(
//                                    crossAxisAlignment: CrossAxisAlignment.start,
//                                    children: <Widget>[
//                                      Divider(
//                                        height: 0,
//                                      ),
//                                      Padding(
//                                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
//                                        child: ListTile(
//                                          trailing: Icon(Icons.navigate_next),
//                                          leading: ClipRRect(
//                                            borderRadius: BorderRadius.circular(5.0),
//                                            child: Container(
//                                              decoration: BoxDecoration(
//                                                  color: Colors.blue
//                                              ),
//                                              child: CachedNetworkImage(
//                                                fit: BoxFit.cover,
//                                                imageUrl: product['image'],
//                                                placeholder: (context, url) => Center(
//                                                    child: CircularProgressIndicator()
//                                                ),
//                                                errorWidget: (context, url, error) => new Icon(Icons.error),
//                                              ),
//                                            ),
//                                          ),
//                                          title: Text(
//                                            product['name'],
//                                            style: TextStyle(
//                                                fontSize: 14
//                                            ),
//                                          ),
//                                          subtitle: Column(
//                                            crossAxisAlignment: CrossAxisAlignment.start,
//                                            children: <Widget>[
//                                              Row(
//                                                children: <Widget>[
//                                                  Padding(
//                                                    padding: const EdgeInsets.only(top: 2.0, bottom: 1),
//                                                    child: Text('\$200', style: TextStyle(
//                                                      color: Theme.of(context).accentColor,
//                                                      fontWeight: FontWeight.w700,
//                                                    )),
//                                                  ),
//                                                  Padding(
//                                                    padding: const EdgeInsets.only(left: 6.0),
//                                                    child: Text('(\$400)', style: TextStyle(
//                                                        fontWeight: FontWeight.w700,
//                                                        fontStyle: FontStyle.italic,
//                                                        color: Colors.grey,
//                                                        decoration: TextDecoration.lineThrough
//                                                    )),
//                                                  )
//                                                ],
//                                              ),
//                                              Row(
//                                                children: <Widget>[
//                                                  SmoothStarRating(
//                                                      allowHalfRating: false,
//                                                      onRatingChanged: (v) {
//                                                        product['rating'] = v;
//                                                        setState(() {});
//                                                      },
//                                                      starCount: 5,
//                                                      rating: product['rating'],
//                                                      size: 16.0,
//                                                      color: Colors.amber,
//                                                      borderColor: Colors.amber,
//                                                      spacing:0.0
//                                                  ),
//                                                  Padding(
//                                                    padding: const EdgeInsets.only(left: 6.0),
//                                                    child: Text('(4)', style: TextStyle(
//                                                      fontWeight: FontWeight.w300,
//                                                      color: Theme.of(context).primaryColor
//                                                    )),
//                                                  )
//                                                ],
//                                              )
//                                            ],
//                                          ),
//                                        ),
//                                      ),
//                                    ],
//                                  ),
//                                );
//                              },
//                            );
//                          }).toList(),
//                        ),
//                      ),
//                      Container(
//                        child: GridView.count(
//                          shrinkWrap: true,
//                          crossAxisCount: 2,
//                          childAspectRatio: 0.7,
//                          padding: EdgeInsets.only(top: 8, left: 6, right: 6, bottom: 12),
//                          children: List.generate(products.length, (index) {
//                            return Container(
//                              child: Card(
//                                clipBehavior: Clip.antiAlias,
//                                child: InkWell(
//                                  onTap: () {
//                                    print('Card tapped.');
//                                  },
//                                  child: Column(
//                                    crossAxisAlignment: CrossAxisAlignment.start,
//                                    children: <Widget>[
//                                      SizedBox(
//                                        height: (MediaQuery.of(context).size.width / 2 - 5),
//                                        width: double.infinity,
//                                        child: CachedNetworkImage(
//                                          fit: BoxFit.cover,
//                                          imageUrl: products[index]['image'],
//                                          placeholder: (context, url) => Center(
//                                              child: CircularProgressIndicator()
//                                          ),
//                                          errorWidget: (context, url, error) => new Icon(Icons.error),
//                                        ),
//                                      ),
//                                      Padding(
//                                        padding: const EdgeInsets.only(top: 5.0),
//                                        child: ListTile(
//                                            title: Text(
//                                              'Two Gold Rings',
//                                              style: TextStyle(
//                                                  fontWeight: FontWeight.bold,
//                                                  fontSize: 16
//                                              ),
//                                            ),
//                                          subtitle: Column(
//                                            crossAxisAlignment: CrossAxisAlignment.start,
//                                            children: <Widget>[
//                                              Row(
//                                                children: <Widget>[
//                                                  Padding(
//                                                    padding: const EdgeInsets.only(top: 2.0, bottom: 1),
//                                                    child: Text('\$200', style: TextStyle(
//                                                      color: Theme.of(context).accentColor,
//                                                      fontWeight: FontWeight.w700,
//                                                    )),
//                                                  ),
//                                                  Padding(
//                                                    padding: const EdgeInsets.only(left: 6.0),
//                                                    child: Text('(\$400)', style: TextStyle(
//                                                        fontWeight: FontWeight.w700,
//                                                        fontStyle: FontStyle.italic,
//                                                        color: Colors.grey,
//                                                        decoration: TextDecoration.lineThrough
//                                                    )),
//                                                  )
//                                                ],
//                                              ),
//                                              Row(
//                                                children: <Widget>[
//                                                  SmoothStarRating(
//                                                      allowHalfRating: false,
//                                                      onRatingChanged: (v) {
//                                                        products[index]['rating'] = v;
//                                                        setState(() {});
//                                                      },
//                                                      starCount: 5,
//                                                      rating: products[index]['rating'],
//                                                      size: 16.0,
//                                                      color: Colors.amber,
//                                                      borderColor: Colors.amber,
//                                                      spacing:0.0
//                                                  ),
//                                                  Padding(
//                                                    padding: const EdgeInsets.only(left: 6.0),
//                                                    child: Text('(4)', style: TextStyle(
//                                                        fontWeight: FontWeight.w300,
//                                                        color: Theme.of(context).primaryColor
//                                                    )),
//                                                  )
//                                                ],
//                                              )
//                                            ],
//                                          ),
//                                        ),
//                                      )
//                                    ],
//                                  ),
//                                ),
//                              ),
//                            );
//                          }),
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ],
//            ))
      ),
    );
  }
}
