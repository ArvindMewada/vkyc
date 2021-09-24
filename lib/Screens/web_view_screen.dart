import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewMainScreen extends StatefulWidget {
  final String url;

  const WebViewMainScreen({Key? key, required this.url}) : super(key: key);

  @override
  _WebViewMainScreenState createState() => _WebViewMainScreenState();
}

class _WebViewMainScreenState extends State<WebViewMainScreen> {
  late InAppWebViewController _webViewController;
  var result;
  double _progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8.0,
        backgroundColor: Colors.blue,
        title: Text(
          "V KYC Demo",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
            onProgressChanged:
                (InAppWebViewController controller, int progress) {
              setState(() {
                _progress = progress / 100;
              });
            },
            initialOptions: InAppWebViewGroupOptions(
                android: AndroidInAppWebViewOptions(
                  domStorageEnabled: true,
                  databaseEnabled: true,
                  clearSessionCache: true,
                  thirdPartyCookiesEnabled: true,
                  allowFileAccess: true,
                  allowContentAccess: true,
                ),
                crossPlatform: InAppWebViewOptions(
                  javaScriptEnabled: true,
                  mediaPlaybackRequiresUserGesture: true,
                  javaScriptCanOpenWindowsAutomatically: true,
                  verticalScrollBarEnabled: true,
                  useShouldOverrideUrlLoading: true,
                  useShouldInterceptAjaxRequest: true,
                  horizontalScrollBarEnabled: true,
                ),
                ios: IOSInAppWebViewOptions(
                  allowsAirPlayForMediaPlayback: true,
                  allowsPictureInPictureMediaPlayback: true,
                )),
            onWebViewCreated: (InAppWebViewController controller) {
              _webViewController = controller;
            },
            androidOnGeolocationPermissionsShowPrompt:
                (InAppWebViewController controller, String origin) async {
              result = await showDialog<bool>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Allow access location $origin'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text('Allow access location $origin'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Allow'),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                      ),
                      TextButton(
                        child: Text('Denied'),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                      ),
                    ],
                  );
                },
              );
              if (result) {
                return Future.value(GeolocationPermissionShowPromptResponse(
                    origin: origin, allow: true, retain: true));
              } else {
                return Future.value(GeolocationPermissionShowPromptResponse(
                    origin: origin, allow: false, retain: false));
              }
            },
            androidOnPermissionRequest: (InAppWebViewController controller,
                String origin, List<String> resources) async {
              return PermissionRequestResponse(
                  resources: resources,
                  action: PermissionRequestResponseAction.GRANT);
            },
          ),
          _progress < 1
              ? SizedBox(
                  height: 5,
                  child: LinearProgressIndicator(
                    value: _progress,
                    backgroundColor:
                        Theme.of(context).primaryColor.withOpacity(0.2),
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
