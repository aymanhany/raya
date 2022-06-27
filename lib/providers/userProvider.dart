import 'package:flutter/cupertino.dart';

class userProvider extends ChangeNotifier {
  // var token;
  var isLoggedIn = false;
  var userData;
  // get tokenholder => token;
  get isLoggedInGetter => isLoggedIn;

  get userDataGetter => userData;
}
