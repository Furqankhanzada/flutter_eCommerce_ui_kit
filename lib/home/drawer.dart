import 'package:flutter/material.dart';
import 'package:flutter_scaffold/blocks/auth_block.dart';
import 'package:provider/provider.dart';
import 'package:flutter_scaffold/localizations.dart';
import 'package:flutter_scaffold/blocks/cart.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    AuthBlock auth = Provider.of<AuthBlock>(context);
    final isLoggedIn = auth.isLoggedIn;
    print("isLoggedIn $isLoggedIn");
    return Column(
      children: <Widget>[
        if (auth.isLoggedIn)
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/drawer-header.jpg'),
            )),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://avatars2.githubusercontent.com/u/2400215?s=120&v=4'),
            ),
            accountEmail: Text(auth.user['user_email']),
            accountName: Text(auth.user['user_display_name']),
          ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.home, color: Theme.of(context).accentColor),
                title: Text(AppLocalizations.of(context).translate('HOME')),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.shopping_basket,
                    color: Theme.of(context).accentColor),
                title: Text(AppLocalizations.of(context).translate('SHOP')),
                trailing: Text('New',
                    style: TextStyle(color: Theme.of(context).primaryColor)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/shop');
                },
              ),
              ListTile(
                leading:
                    Icon(Icons.category, color: Theme.of(context).accentColor),
                title:
                    Text(AppLocalizations.of(context).translate('CATEGORIES')),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/categorise');
                },
              ),
              ListTile(
                leading:
                    Icon(Icons.favorite, color: Theme.of(context).accentColor),
                title:
                    Text(AppLocalizations.of(context).translate('MY_WISHLIST')),
                trailing: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Text('4',
                      style: TextStyle(color: Colors.white, fontSize: 10.0)),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/wishlist');
                },
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart,
                    color: Theme.of(context).accentColor),
                title: Text(AppLocalizations.of(context).translate('MY_CART')),
                trailing: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Text('2',
                      style: TextStyle(color: Colors.white, fontSize: 10.0)),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/cart');
                },
              ),
              if(!auth.isLoggedIn) ListTile(
                      leading: Icon(Icons.lock,
                          color: Theme.of(context).accentColor),
                      title:
                          Text(AppLocalizations.of(context).translate('LOGIN')),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/auth');
                      },
                    ),
              Divider(),
              if(auth.isLoggedIn) ListTile(
                leading:
                    Icon(Icons.settings, color: Theme.of(context).accentColor),
                title: Text(AppLocalizations.of(context).translate('SETTINGS')),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/settings');
                },
              ),
              if(auth.isLoggedIn) ListTile(
                leading: Icon(Icons.exit_to_app,
                    color: Theme.of(context).accentColor),
                title: Text(AppLocalizations.of(context).translate('LOGOUT')),
                onTap: () async {
                  await auth.logout();
//                  await cartBlock.emptyCart();
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
