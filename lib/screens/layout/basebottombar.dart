import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raya/main.dart';
import 'package:raya/providers/userProvider.dart';
import 'package:raya/screens/support.dart';
import 'package:raya/screens/user/Profile.dart';
import 'package:raya/screens/user/login.dart';

class BaseBottomBar extends StatelessWidget {
  const BaseBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedFontSize: 0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {
              if (Provider.of<userProvider>(context, listen: false)
                      .isLoggedInGetter ==
                  true) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Support()));
              } else {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              }
            },
            icon: Icon(Icons.support_agent),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
              onPressed: () => (Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ),
                  )),
              icon: Icon(Icons.home)),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
              onPressed: () {
                if (Provider.of<userProvider>(context, listen: false)
                        .isLoggedInGetter ==
                    true) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                } else {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                }
              },
              icon: Icon(Icons.person)),
          label: '',
        ),
      ],
    );
  }
}
