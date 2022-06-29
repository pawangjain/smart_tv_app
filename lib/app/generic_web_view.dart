import 'package:dadabhagwan_tv/common/app_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class GenericWebView extends StatefulWidget {
  final String videoURL;

  GenericWebView({
    Key key,
    @required this.videoURL,
  });

  @override
  _GenericWebViewState createState() => _GenericWebViewState();
}

class _GenericWebViewState extends State<GenericWebView> {
  final GlobalKey webViewKey = GlobalKey();
  InAppWebViewController webViewController;
  int errorTime = 0;

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      mediaPlaybackRequiresUserGesture: false,
      javaScriptEnabled: true,
      
    ),
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,// true,// AppData.currPhysicalDevice.isAndroidOs, // on android < 9, this stops video flicker
    ),
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
    ),
  );

  @override
  void initState() {
    super.initState();
  }

  bool _isPageLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              // shortcuts: <LogicalKeySet, Intent>{
              //   LogicalKeySet(LogicalKeyboardKey.select): ActivateIntent(),
              // },
              child: InAppWebView(
                key: webViewKey,
                initialUrlRequest: URLRequest(
                  url: Uri.parse(
                    "${widget.videoURL}",
                  ),
                ),
                initialOptions: options,
                onWebViewCreated: (controller) {
                  webViewController = controller;
                  // controller.loadData(
                  //     data:
                  //         '<iframe src=\"${widget.videoURL}\" height=\"315\" width=\"560\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>');
                },
                onLoadStop: (e, r) {
                  print("onLoadStop");
                  _isPageLoaded = true;
                  setState(() {
                    // this.url = url;
                  });
                },
              ),
            ),
            !_isPageLoaded
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
