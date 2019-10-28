import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment(-1, 1),
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage("https://images.pexels.com/photos/248797/pexels-photo-248797.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white, size: 32,
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide( //                   <--- left side
                              color: Colors.grey[300],
                              width: 1.0,
                            )
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
                          child: Text(
                            'John Doe',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        )
                      )
                    ],
                  ),
                  ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.edit, color: Theme.of(context).accentColor, size: 28,),
                        title: Text('Profile', style: TextStyle(color: Colors.black, fontSize: 17)),
                        trailing: Icon(Icons.keyboard_arrow_right, color: Theme.of(context).accentColor),
                      ),
                      ListTile(
                        leading: Icon(Icons.notifications, color: Theme.of(context).accentColor, size: 28,),
                        title: Text('Notifications', style: TextStyle(color: Colors.black, fontSize: 17)),
                        trailing: Icon(Icons.keyboard_arrow_right, color: Theme.of(context).accentColor),
                      ),
                      ListTile(
                        leading: Icon(Icons.panorama, color: Theme.of(context).accentColor, size: 28,),
                        title: Text('Progress', style: TextStyle(color: Colors.black, fontSize: 17)),
                        trailing: Icon(Icons.keyboard_arrow_right, color: Theme.of(context).accentColor),
                      ),
                      ListTile(
                        leading: Icon(Icons.favorite, color: Theme.of(context).accentColor, size: 28,),
                        title: Text('Favorite', style: TextStyle(color: Colors.black, fontSize: 17)),
                        trailing: Icon(Icons.keyboard_arrow_right, color: Theme.of(context).accentColor),
                      ),
                      ListTile(
                        leading: Icon(Icons.feedback, color: Theme.of(context).accentColor, size: 28,),
                        title: Text('Feedback', style: TextStyle(color: Colors.black, fontSize: 17)),
                        trailing: Icon(Icons.keyboard_arrow_right, color: Theme.of(context).accentColor),
                      ),
                      ListTile(
                        leading: Icon(Icons.add_photo_alternate, color: Theme.of(context).accentColor, size: 28,),
                        title: Text('About Us', style: TextStyle(color: Colors.black, fontSize: 17)),
                        trailing: Icon(Icons.keyboard_arrow_right, color: Theme.of(context).accentColor),
                      ),
                      ListTile(
                        leading: Icon(Icons.vpn_key, color: Theme.of(context).accentColor, size: 28,),
                        title: Text('Change Password', style: TextStyle(color: Colors.black, fontSize: 17)),
                        trailing: Icon(Icons.keyboard_arrow_right, color: Theme.of(context).accentColor),
                      ),
                      ListTile(
                        leading: Icon(Icons.lock, color: Theme.of(context).accentColor, size: 28,),
                        title: Text('Logout', style: TextStyle(color: Colors.black, fontSize: 17)),
                        trailing: Icon(Icons.keyboard_arrow_right, color: Theme.of(context).accentColor),
                      ),
                    ],
                  )
                ],
              ),
          ),
        )
    );
  }
}
