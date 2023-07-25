import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_kit/localizations.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!
              .translate('SETTINGS')),
        ),
        body: SafeArea(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment(1, 1),
                    width: MediaQuery.of(context).size.width,
                    height: 190,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage("https://images.pexels.com/photos/236047/pexels-photo-236047.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(right: 10, bottom: 10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: new BorderRadius.circular(60),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white, size: 32,
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          border: Border(
                            bottom: BorderSide( //                   <--- left side
                              color: Colors.grey.shade300,
                              width: 1.0,
                            )
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
                          child: Text(
                            'John Doe',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child:  ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        ReuseableSettingCard(title: 'Profile',leadingIcon: Icons.edit,trailingIcon: Icons.keyboard_arrow_right,),
                        ReuseableSettingCard(leadingIcon: Icons.notifications, trailingIcon: Icons.keyboard_arrow_right, title: 'Notifications'),
                       ReuseableSettingCard(leadingIcon: Icons.panorama, trailingIcon: Icons.keyboard_arrow_right, title: 'Progress'),
                        ReuseableSettingCard(leadingIcon: Icons.favorite, trailingIcon: Icons.keyboard_arrow_right, title: 'Favorite'),
                       ReuseableSettingCard(leadingIcon: Icons.feedback, trailingIcon: Icons.keyboard_arrow_right, title: 'Feedback'),
                        ReuseableSettingCard(leadingIcon: Icons.add_photo_alternate, trailingIcon: Icons.keyboard_arrow_right, title: 'About Us'),
                        ReuseableSettingCard(leadingIcon: Icons.vpn_key, trailingIcon: Icons.keyboard_arrow_right, title: 'Change Password'),
                        ReuseableSettingCard(leadingIcon: Icons.lock, trailingIcon: Icons.keyboard_arrow_right, title: 'Logout'),
                      ],
                    ),
                  ),
                ],
              ),
        )
    );
  }
}

class ReuseableSettingCard extends StatelessWidget {
final IconData leadingIcon;
final IconData trailingIcon;
final String title;

  const ReuseableSettingCard({Key? key,required this.leadingIcon,required this.trailingIcon,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(leadingIcon, color: Theme.of(context).accentColor, size: 28,),
        title: Text(title, style: TextStyle(color: Colors.black, fontSize: 17)),
        trailing: Icon(trailingIcon, color: Theme.of(context).accentColor),
      ),
    );
  }
}
