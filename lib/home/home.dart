import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {

            },
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image(
                  image: NetworkImage('https://image.freepik.com/free-photo/yellow-blue-pink-background_23-2147704125.jpg'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 20),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage('https://avatars2.githubusercontent.com/u/2400215?s=120&v=4'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 130, left: 20),
                  child: Text('Muhammad Furqan', style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 155, left: 20),
                  child: Text('furqan.khanzada@gmail.com', style: TextStyle(
                      fontSize: 14,
                      color: Colors.white
                  )),
                )
              ],
            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.shopping_basket),
                  title: Text('Shop'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/products');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.category),
                  title: Text('Categorise'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/products');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text('My Wishlist'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/products');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text('My Cart'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/products');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.lock),
                  title: Text('Login'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/auth');
                  },
                )
              ],
            )
          ],
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: 250,
        child: Stack(
          children: <Widget>[
            Center(
              child: CarouselSlider(
                autoPlay: true,
                pauseAutoPlayOnTouch: Duration(seconds: 10),
                height: 250.0,
                viewportFraction: 1.0,
                items: imgList.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: i,
                            placeholder: (context, url) => Center(
                                child: CircularProgressIndicator()
                            ),
                            errorWidget: (context, url, error) => new Icon(Icons.error),
                          )
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
