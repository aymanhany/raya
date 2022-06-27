import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raya/main.dart';
import 'package:raya/models/CarModel.dart';
import 'package:raya/models/UserModel.dart';
import 'package:raya/providers/userProvider.dart';
import 'package:raya/screens/buy/order_confirmation.dart';
import 'package:raya/screens/layout/appBar.dart';
import 'package:raya/screens/layout/basebottombar.dart';
import 'package:raya/screens/layout/colors.dart';

import 'package:webview_flutter/webview_flutter.dart';

class Visa extends StatefulWidget {
  final carsList carData;
  String url;

  Visa({Key? key, required this.url, required this.carData}) : super(key: key);

  @override
  State<Visa> createState() => _VisaState();
}

class _VisaState extends State<Visa> {
  @override
  Widget build(BuildContext context) {
    final User user =
        Provider.of<userProvider>(context, listen: false).userDataGetter;
    var url = widget.url;
    return Scaffold(
        appBar: BaseAppBar(),
        body: WebView(
          initialUrl: Uri.dataFromString(
                  '<html><head><style>body {width:100%;height:100%} .pay-iframe{width:100%;height:100%} .pay-iframe iframe {width:100%;height:100%;}</style></head><body><div class="pay-iframe" style="width:100%;height:100%;">$url</div></body></html>',
                  mimeType: 'text/html')
              .toString(),
          javascriptMode: JavascriptMode.unrestricted,
          navigationDelegate: (request) {
            if (request.url.contains("success=true")) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderConfirmation(
                    carData: widget.carData,
                    user: user,
                  ),
                ),
              );
              return NavigationDecision.prevent;
            } else if (request.url.contains("success=true")) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: kPrimaryColor,
                  content: Text(
                    'Error processing your payment please try again later!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
              return NavigationDecision.navigate;
            } else {
              return NavigationDecision.navigate;
            }
          },
        ),
        bottomNavigationBar: BaseBottomBar());
  }
}
