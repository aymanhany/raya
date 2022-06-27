import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raya/providers/userProvider.dart';
import 'package:raya/screens/user/login.dart';
import 'package:raya/screens/user/notifications.dart';

import 'colors.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: RotatedBox(
          quarterTurns: -2,
          child: Image.asset(
            'images/Share-Icon.png',
            width: 30,
          ),
        ),
        onPressed: () {
          Navigator.pop(context, true);
        },
      ),
      title: Center(
          child: Image.asset(
        'images/Raya-Logo.png',
        width: MediaQuery.of(context).size.width * 0.4,
      )),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications),
          color: kPrimaryColor,
          onPressed: () {
            if (Provider.of<userProvider>(context, listen: false).isLoggedInGetter == true) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications()));
            } else {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
            }
          },
        ),
        SizedBox(width: 10),
      ],
    );
  }

  Size get preferredSize => new Size.fromHeight(100);
}
