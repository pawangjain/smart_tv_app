import 'package:dadabhagwan_tv/common/app_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebIframe extends StatefulWidget {
  final String videoURL;
  final int startFrom;
  final DateTime responseTime;

  WebIframe({
    Key key,
    @required this.videoURL,
    @required this.startFrom,
    @required this.responseTime,
  });

  @override
  _WebIframeState createState() => _WebIframeState();
}

class _WebIframeState extends State<WebIframe> {
  final GlobalKey webViewKey = GlobalKey();
  InAppWebViewController webViewController;
  int errorTime = 0;

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      mediaPlaybackRequiresUserGesture: false,
      javaScriptEnabled: true,
    ),
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,// AppData.currPhysicalDevice.isAndroidOs, // on android < 9, this stops video flicker
    ),
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
    ),
  );

  calculateStartTime() {
    DateTime now = DateTime.now();
    errorTime = now.difference(widget.responseTime).inSeconds;
    webViewController?.reload();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: InAppWebView(
          key: webViewKey,
          initialUrlRequest: URLRequest(
            // url: Uri.parse("http://dadabhagwan.tv/jiotv/${widget.language}/"),
            /// #t time reqrd for vimeo player
            /// https://vimeo.zendesk.com/hc/en-us/articles/360001494447-Using-Player-Parameters
            url: Uri.parse(
              "${widget.videoURL}?autoplay=1&transparent=0&#t=${widget.startFrom + errorTime}s",
            ),
          ),
          initialOptions: options,
          onWebViewCreated: (controller) {
            webViewController = controller;
            calculateStartTime();
          },
        ),
      ),
    );
  }
}
