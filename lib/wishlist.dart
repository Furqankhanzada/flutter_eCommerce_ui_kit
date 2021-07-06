import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class WishList extends StatefulWidget {
  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<WishList> {

  final List<Map<dynamic, dynamic>> products = [
    {'name': 'IPhone', 'rating': 3.0, 'image': 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'},
    {'name': 'IPhone X 2', 'rating': 3.0, 'image': 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80'},
    {'name': 'IPhone 11', 'rating': 4.0, 'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'},
    {'name': 'IPhone 11', 'rating': 4.0, 'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'},
    {'name': 'IPhone 11', 'rating': 4.0, 'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'},
    {'name': 'IPhone 11', 'rating': 4.0, 'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'},
    {'name': 'IPhone 11', 'rating': 4.0, 'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'},
    {'name': 'IPhone 11', 'rating': 4.0, 'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'},
    {'name': 'IPhone 11', 'rating': 4.0, 'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80'},
    {'name': 'IPhone 12', 'rating': 5.0, 'image': 'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final item = products[index];
          return Dismissible(
            // Each Dismissible must contain a Key. Keys allow Flutter to
            // uniquely identify widgets.
            key: Key(UniqueKey().toString()),
            // Provide a function that tells the app
            // what to do after an item has been swiped away.
            onDismissed: (direction) {
              if(direction == DismissDirection.endToStart) {
                // Then show a snackbar.
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text(item['name'] + " dismissed"), duration: Duration(seconds: 1)));
              } else {
                // Then show a snackbar.
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text(item['name'] + " added to carts"), duration: Duration(seconds: 1)));
              }
              // Remove the item from the data source.
              setState(() {
                products.removeAt(index);
              });
            },
            // Show a red background as the item is swiped away.
            background: Container(
              decoration: BoxDecoration(color: Colors.green),
              padding: EdgeInsets.all(5.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Icon(Icons.add_shopping_cart, color: Colors.white),
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
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: ListTile(
                      trailing: Icon(Icons.swap_horiz),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue
                          ),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: item['image'],
                            placeholder: (context, url) => Center(
                                child: CircularProgressIndicator()
                            ),
                            errorWidget: (context, url, error) => new Icon(Icons.error),
                          ),
                        ),
                      ),
                      title: Text(
                        item['name'],
                        style: TextStyle(
                            fontSize: 14
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 2.0, bottom: 1),
                                child: Text('\$200', style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontWeight: FontWeight.w700,
                                )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 6.0),
                                child: Text('(\$400)', style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough
                                )),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              RatingStars(
                                value: item['rating'],
                                starSize: 16,
                                valueLabelColor: Colors.amber,
                                starColor: Colors.amber,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
