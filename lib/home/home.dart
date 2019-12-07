import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scaffold/blocks/categories_block.dart';
import 'package:flutter_scaffold/blocks/products_block.dart';
import 'package:flutter_scaffold/localizations.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:html_unescape/html_unescape.dart';

import 'drawer.dart';
import 'slider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      // Here you can write your code
      final CategoriesBlock categoryBlock = Provider.of<CategoriesBlock>(context);
      final ProductsBlock productBlock = Provider.of<ProductsBlock>(context);
      categoryBlock.getCategories();
      productBlock.getNewArrivals();
    });
  }

  Widget build(BuildContext context) {
    final ProductsBlock productBlock = Provider.of<ProductsBlock>(context);
    final CategoriesBlock categoriesBlock =
        Provider.of<CategoriesBlock>(context);
    final categories = categoriesBlock.categories;
    List<dynamic> newArrivals = productBlock.newArrivals;
    var unescape = new HtmlUnescape();
    var currency = unescape.convert(productBlock.currency);
    return Scaffold(
      drawer: Drawer(
        child: AppDrawer(),
      ),
      body: SafeArea(
        top: false,
        left: false,
        right: false,
        child: CustomScrollView(
            // Add the app bar and list of items as slivers in the next steps.
            slivers: <Widget>[
              SliverAppBar(
                // Provide a standard title.
                // title: Text('asdas'),
                // pinned: true,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                  )
                ],
                // Allows the user to reveal the app bar if they begin scrolling
                // back up the list of items.
                // floating: true,
                // Display a placeholder widget to visualize the shrinking size.
                flexibleSpace: HomeSlider(),
                // Make the initial height of the SliverAppBar larger than normal.
                expandedHeight: 300,
              ),
              SliverList(
                // Use a delegate to build items as they're scrolled on screen.
                delegate: SliverChildBuilderDelegate(
                  // The builder function returns a ListTile with a title that
                  // displays the index of the current item.
                  (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.only(top: 14.0, left: 8.0, right: 8.0),
                        child: Text(
                            AppLocalizations.of(context)
                                .translate('NEW_ARRIVALS'),
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
                          children: newArrivals.length == 0
                              ? [1, 2, 3, 4].map((i) {
//                            i["thumbnail"] = imgList[newArrivals.indexOf(i)];
//                            print(i["thumbnail"]);
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                        width: 140.0,
                                        child: Card(
                                          clipBehavior: Clip.antiAlias,
                                          child: InkWell(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Shimmer.fromColors(
                                                  baseColor: Colors.grey[300],
                                                  highlightColor:
                                                      Colors.grey[100],
                                                  enabled: true,
                                                  child: Column(
                                                    children: [0]
                                                        .map((_) => Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      bottom:
                                                                          8.0),
                                                              child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    width:
                                                                        138.0,
                                                                    height: 150,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ],
                                                              ),
                                                            ))
                                                        .toList(),
                                                  ),
                                                ),
                                                Shimmer.fromColors(
                                                  baseColor: Colors.grey[300],
                                                  highlightColor:
                                                      Colors.grey[100],
                                                  enabled: true,
                                                  child: Column(
                                                    children: [0]
                                                        .map((_) => Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 5.0,
                                                                      right:
                                                                          5.0),
                                                              child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    width:
                                                                        135.0,
                                                                    height: 10,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ],
                                                              ),
                                                            ))
                                                        .toList(),
                                                  ),
                                                ),
                                                Shimmer.fromColors(
                                                  baseColor: Colors.grey[300],
                                                  highlightColor:
                                                      Colors.grey[100],
                                                  enabled: true,
                                                  child: Column(
                                                    children: [0]
                                                        .map((_) => Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 10.0,
                                                                      left:
                                                                          5.0),
                                                              child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    width: 50.0,
                                                                    height: 10,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ],
                                                              ),
                                                            ))
                                                        .toList(),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }).toList()
                              : newArrivals.map((i) {
//                            i["thumbnail"] = imgList[newArrivals.indexOf(i)];
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                        width: 140.0,
                                        child: Card(
                                          clipBehavior: Clip.antiAlias,
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, '/products',
                                                  arguments: i);
                                            },
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                SizedBox(
                                                  height: 160,
                                                  child: Hero(
                                                    tag: i["thumbnail"],
                                                    child: CachedNetworkImage(
                                                      fit: BoxFit.cover,
                                                      imageUrl: i["thumbnail"],
                                                      placeholder: (context,
                                                              url) =>
                                                          Center(
                                                              child:
                                                                  CircularProgressIndicator()),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          new Icon(Icons.error),
                                                    ),
                                                  ),
                                                ),
                                                ListTile(
                                                  title: Text(
                                                    i['name'],
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                  subtitle: Text(
                                                      "$currency 200",
                                                      style: TextStyle(
                                                          color:
                                                              Theme.of(context)
                                                                  .accentColor,
                                                          fontWeight:
                                                              FontWeight.w700)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 6.0, left: 8.0, right: 8.0),
                          child: newArrivals.length == 0
                              ? Shimmer.fromColors(
                                  baseColor: Colors.grey[300],
                                  highlightColor: Colors.grey[100],
                                  enabled: true,
                                  child: Column(
                                    children: [0]
                                        .map((_) => Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8.0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 150,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                )
                              : Image(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage('assets/images/banner-1.png'),
                                ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: 8.0, left: 8.0, right: 8.0),
                            child: Text(
                                AppLocalizations.of(context)
                                    .translate('SHOP_BY_CATEGORY'),
                                style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 8.0, top: 8.0, left: 8.0),
                            child: RaisedButton(
                                color: Theme.of(context).primaryColor,
                                child: Text('View All',
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/categorise');
                                }),
                          )
                        ],
                      ),
                      Container(
                        child: GridView.count(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            padding: EdgeInsets.only(
                                top: 8, left: 6, right: 6, bottom: 12),
                            children: categories.length == 0
                                ? [1, 2].map((i) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return Container(
                                          width: 140.0,
                                          child: Card(
                                            clipBehavior: Clip.antiAlias,
                                            child: InkWell(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Shimmer.fromColors(
                                                    baseColor: Colors.grey[300],
                                                    highlightColor:
                                                        Colors.grey[100],
                                                    enabled: true,
                                                    child: Column(
                                                      children: [0]
                                                          .map((_) => Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width,
                                                                    height: (MediaQuery.of(context).size.width /
                                                                            2) -
                                                                        70,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ],
                                                              ))
                                                          .toList(),
                                                    ),
                                                  ),
                                                  Shimmer.fromColors(
                                                    baseColor: Colors.grey[300],
                                                    highlightColor:
                                                        Colors.grey[100],
                                                    enabled: true,
                                                    child: Column(
                                                      children: [0]
                                                          .map((_) => Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            5.0,
                                                                        top:
                                                                            10.0),
                                                                child: Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          10,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ))
                                                          .toList(),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }).toList()
                                : List.generate(categories.length, (index) {
                                    return Container(
                                      child: Card(
                                        clipBehavior: Clip.antiAlias,
                                        child: InkWell(
                                          onTap: () {
                                            print('Card tapped.');
                                          },
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              SizedBox(
                                                height: (MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2) -
                                                    70,
                                                width: double.infinity,
                                                child: CachedNetworkImage(
                                                  fit: BoxFit.cover,
                                                  imageUrl: imgList[index],
                                                  placeholder: (context, url) =>
                                                      Center(
                                                          child:
                                                              CircularProgressIndicator()),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          new Icon(Icons.error),
                                                ),
                                              ),
                                              ListTile(
                                                  title: Text(
                                                categories[index]['name'],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16),
                                              ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  })),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 6.0, left: 8.0, right: 8.0, bottom: 10),
                          child: newArrivals.length == 0
                              ? Shimmer.fromColors(
                                  baseColor: Colors.grey[300],
                                  highlightColor: Colors.grey[100],
                                  enabled: true,
                                  child: Column(
                                    children: [0]
                                        .map((_) => Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8.0),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 150,
                                                    color: Colors.white,
                                                  ),
                                                ],
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                )
                              : Image(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage('assets/images/banner-2.png'),
                                ),
                        ),
                      )
                    ],
                  ),
                  // Builds 1000 ListTiles
                  childCount: 1,
                ),
              )
            ]),
      ),
    );
  }
}
