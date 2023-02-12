import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:spinzy/core/constant/colors.dart';
import 'package:spinzy/ui/screens/home/home_provider.dart';
import 'package:spinzy/ui/screens/web_view/web_view_provider.dart';

import 'package:webview_flutter/webview_flutter.dart';

import '../../../core/enums/view_state.dart';

class WebViewscreen extends StatefulWidget {
  final link;
  WebViewscreen({Key? key, this.link});

  @override
  State<WebViewscreen> createState() => _WebViewscreenState();
}

class _WebViewscreenState extends State<WebViewscreen> {
  int count = 0;

  @override

  Widget build(BuildContext context) {
    WebViewController _controller;
    print("link ${widget.link}");
    return ChangeNotifierProvider(
        create: (context) => WebViewProvider(),
        child: Consumer<WebViewProvider>(builder: (context, model, child) {
          return ModalProgressHUD(
            progressIndicator: CircularProgressIndicator(
              color: Colors.blue,
            ),
            inAsyncCall: model.state == ViewState.busy,
            child: Scaffold(
              appBar: AppBar(
                leading: BackButton(
                  onPressed: (){
                    onEnd=false;
                    setState(() {

                    });
                    Navigator.pop(context);
                  },
                ),
                backgroundColor: primaryColor,

              ),
              body: SafeArea(

                child: WebView(
                    onPageStarted: (h) {
                      if (count == 0) model.busy(); /**/
                      count++;
                    },
                    onPageFinished: (a) {
                      model.idle();
                    },
                    initialUrl: widget.link,
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (WebViewController webViewController) {
                      _controller = webViewController;
                    }),
              ),
            ),
          );
        }));
  }
}
