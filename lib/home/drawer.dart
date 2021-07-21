import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_kit/blocks/auth_block.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ecommerce_ui_kit/localizations.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    AuthBlock auth = Provider.of<AuthBlock>(context);
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
              ReuseableDrawerListTile(title: 'HOME',icon: Icons.home,onTab:()=>Navigator.pop(context), ),
              ReuseableDrawerListTile(title: 'SHOP', icon: Icons.shopping_basket, onTab: ()=>  Navigator.popAndPushNamed(context, '/shop'),trailing: Text('New',style: TextStyle(color: Theme.of(context).primaryColor)),),
              ReuseableDrawerListTile(title: 'CATEGORIES', icon: Icons.category, onTab: ()=>Navigator.popAndPushNamed(context, '/categorise'), ),
              ReuseableDrawerListTile(title: 'MY_WISHLIST', icon: Icons.favorite, onTab: ()=>Navigator.popAndPushNamed(context, '/wishlist'), trailing: trailingContainer(context: context,qty: 4),),
              ReuseableDrawerListTile(title: 'MY_CART', icon: Icons.shopping_cart, onTab: ()=> Navigator.popAndPushNamed(context, '/cart'), trailing: trailingContainer(context: context,qty: 3)),
              if(!auth.isLoggedIn) 
              ReuseableDrawerListTile(title: 'LOGIN', icon: Icons.lock, onTab: ()=>Navigator.popAndPushNamed(context, '/auth')),
              Divider(),
              if(auth.isLoggedIn) 
              ReuseableDrawerListTile(title: 'SETTINGS', icon: Icons.settings, onTab: ()=> Navigator.popAndPushNamed(context, '/settings') ),
              if(auth.isLoggedIn) 
              ReuseableDrawerListTile(title: 'LOGOUT', icon: Icons.exit_to_app, onTab: ()async{
                 await auth.logout();
                 //                  await cartBlock.emptyCart();
              }),
            ],
          ),
        )
      ],
    );
  }

  Container trailingContainer({required BuildContext context,required int qty}) {
    return Container(
                padding: const EdgeInsets.all(10.0),
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: Text(qty.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 10.0)),
              );
  }
}

class ReuseableDrawerListTile extends StatelessWidget {
final String title;
final IconData icon;
final Widget ? trailing ;
final Function onTab;
ReuseableDrawerListTile({required this.title, required this.icon, required this.onTab, this.trailing});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).accentColor),
      trailing: trailing,
      title: Text(AppLocalizations.of(context)!.translate(title)),
      onTap:()=> onTab(),
     
    );
  }
}
