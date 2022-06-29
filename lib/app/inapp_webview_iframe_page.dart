// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:flutter_native_timezone/flutter_native_timezone.dart';
// import 'package:url_launcher/url_launcher.dart';

// class LiveDashboard extends StatefulWidget {
//   @override
//   _LiveDashboardState createState() => _LiveDashboardState();
// }

// class _LiveDashboardState extends State<LiveDashboard>
//     with TickerProviderStateMixin {
//   String youtubeVideoId;
//   InAppWebViewController webView;

//   // String _selectedTabName;
//   TabController _regMethodTabController;
//   ContextMenu contextMenu;

//   /// _selectedTabIndex is used for YouTube Player and WebView Controller
//   /// in setState, we are updating these values along with webView
//   int _selectedTabIndex = 0;
//   String timezoneName = 'Asia/Calcutta'; // Setting default time zone as India
//   String embedUrl = '';
//   String videoId = '';
//   var isVideoPlayed = false;
//   var isYouTube = false;
//   bool isPageLoaded = false;

//   final ScrollController _scrollController = ScrollController();

//   double deviceWidth = 360;
//   double deviceHeight = 640;

//   bool isInternetAvailable = true;

//   @override
//   void initState() {
//     super.initState();
//     _initData();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   onRefresh(BuildContext context) async {
//     await _initData();
//     setState(() {});
//   }

//   void _onRegTabChange() {
//     _selectedTabIndex = _regMethodTabController.index;
//     print('## Current Tab = ' + _selectedTabIndex.toString());
//   }

//   void reLoadWhileVideoChange() {
//     if (true) {
//       //AppData.device.isAndroid) {
//       if (isYouTube) {
//         videoId = youtubeVideoId;
//         webView?.loadData(
//             baseUrl: Uri.parse('https://www.youtube.com'),
//             encoding: 'utf-8',
//             mimeType: 'text/html',
//             data: player);
//       } else {
//         ///Addded below code to reload webview on refresh and onLoad
//         webView?.loadUrl(
//             urlRequest:
//                 URLRequest(url: Uri.parse('https://webplayer.akonnect.org/'))
//             // url: liveSatsangVideoList[_selectedTabIndex]?.videoUrl
//             );
//       }
//       webView?.setOptions(
//           options: InAppWebViewGroupOptions(
//         crossPlatform: InAppWebViewOptions(
//             userAgent: kAndroidUserAgent,
//             // debuggingEnabled: false,
//             mediaPlaybackRequiresUserGesture: false,
//             transparentBackground: true,
//             disableContextMenu: true,
//             supportZoom: false,
//             useShouldOverrideUrlLoading: true,
//             javaScriptEnabled: true,
//             javaScriptCanOpenWindowsAutomatically: true,
//             useOnLoadResource: true),
//         ios: IOSInAppWebViewOptions(
//           allowsInlineMediaPlayback: true,
//           allowsAirPlayForMediaPlayback: true,
//           allowsPictureInPictureMediaPlayback: true,
//         ),
//         android: AndroidInAppWebViewOptions(useWideViewPort: false),
//       ));
//     } else {
//       ///Addded below code to reload webview on refresh and onLoad
//       // webView?.loadUrl(
//       //   url:
//       //       'https://webplayer.akonnect.org/${liveSatsangVideoList[_selectedTabIndex]?.languageName}',
//       //   // url: liveSatsangVideoList[_selectedTabIndex]?.videoUrl
//       // );
//       webView?.loadUrl(
//             urlRequest:
//                 URLRequest(url: Uri.parse('https://webplayer.akonnect.org/'))
//             // url: liveSatsangVideoList[_selectedTabIndex]?.videoUrl
//             );
//     }
//   }

//   Future<void> _initData() async {
//     try {
//       timezoneName = await FlutterNativeTimezone.getLocalTimezone();
//       print('timezoneName --> $timezoneName');
//       //setting it false, User only can set this by play/pause button
//       isVideoPlayed = false;

//       // if (ConnectivityService.isInternetAvailable) {
//       //   AppData.liveModel
//       //       .fetchLiveSatsangDetails(context, timezoneName)
//       //       ?.then((value) {
//       //     /// This flag added to avoid "no-live-event" preload before loading all data
//       //     isPageLoaded = true;

//       //     ///Addded below code to reload webview onRefresh and onLoad
//       //     if (liveSatsangVideoList.isNotEmpty) {
//       //       setState(() {
//       //         reLoadWhileVideoChange();
//       //       });
//       //     }
//       //     if (mounted) {
//       //       print(
//       //           'liveSatsangVideoList ------> ${liveSatsangVideoList.length}');
//       //       _autoPlayYouTube();
//       //       setState(() {});
//       //     }
//       //     _logYouTubeEvents(AppData.liveModel.isLive ? 'Live' : 'Upcoming');
//       //     return;
//       //   });
//       // }

//     } catch (e) {
//       print('Could not get the local timezone');
//     }
//   }

//   void _autoPlayYouTube() {
//     Future.delayed(const Duration(seconds: 3), () {
//       if (isYouTube) {
//         if (isVideoPlayed) {
//           webView?.evaluateJavascript(
//               source:
//                   "\ setTimeout(function () {  play();console.log('from OnxitFull:landscape');   }, 700);");
//         }
//       } else {
//         // webView.evaluateJavascript(
//         //     source:
//         //         "\ setTimeout(function () { console.log('from OnxitFull:landscapeFirst'); if(\$('#play-button').css('visibility')==='visible') { console.log('from OnxitFull:landscape2'); \$('#play-button').trigger( 'click');console.log('from OnxitFull:landscapeSec'); document.getElementById('play-button').click(); console.log('from OnxitFull:landscapeend'); try{youTubePlayer.playVideo();}catch(err){console.log('errr',err);} }  }, 1000);");
//         webView?.evaluateJavascript(
//             source:
//                 "\ setTimeout(function () { console.log('from OnxitFull:landscapeFirst');  try{ if(youTubePlayer.getPlayerState()!==1){console.log('from :::landscapeS'); youTubePlayer.playVideo();console.log('from :::landscapeEND');}} catch(err){console.error('error',err);}  }, 700);");
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // To make this screen full screen.
//     // It will hide status bar and notch.
//     deviceWidth = MediaQuery.of(context).size.width;
//     deviceHeight = MediaQuery.of(context).size.height;
//     print(
//         'LiveDashboard :: deviceWidth :: $deviceWidth, deviceHeight :: $deviceHeight');

//     return SafeArea(
//         child: WillPopScope(
//             onWillPop: () async => true,
//             child: Scaffold(
//                 backgroundColor: Theme.of(context).cardColor,
//                 body: Container(
//                     height: deviceHeight,
//                     child: _buildPage(context)))));
//   }

//   Widget _buildPage(BuildContext context) {

//     return SingleChildScrollView(
//         child: Column(
//       children: [
//          _buildEmbedPlayer(),
//               _buildSubscribeShareRow(),

//         //)
//       ],
//     ));
//   }

//   Container playerContainer;
//   String kAndroidUserAgent =
//       'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';

//   Widget _buildEmbedPlayer() {
//     double height, width;
//     isYouTube =
//         liveSatsangVideoList[_selectedTabIndex]?.isRedirectToYouTube ?? false;

//     height = MediaQuery.of(context).orientation == Orientation.landscape
//         ? 350
//         : (isYouTube ? 220 : 240);
//     width = deviceWidth;
//     print('height of EmbedPlayer :: $height');
//     if (AppData.device.isIos) {
//       playerContainer = Container(
//           margin: const EdgeInsets.symmetric(horizontal: 5),
//           height: height,
//           width: width,
//           padding: EdgeInsets.zero,
//           color: Theme.of(context).scaffoldBackgroundColor,
//           child: InAppWebView(
//             initialUrl:
//                 'https://webplayer.akonnect.org/${liveSatsangVideoList[_selectedTabIndex]?.languageName}',
//             // initialUrl: liveSatsangVideoList[_selectedTabIndex].videoUrl,
//             // initialUrl:"https://youtube.com/embed/RGINbqM3iIY",
//             initialHeaders: {},
//             initialOptions: InAppWebViewGroupOptions(
//               crossPlatform: InAppWebViewOptions(
//                 debuggingEnabled: true,
//                 useShouldOverrideUrlLoading: true,
//               ),
//               ios: IOSInAppWebViewOptions(
//                 allowsInlineMediaPlayback:
//                     false, //It should be false for iPad video fullscreen
//                 allowsAirPlayForMediaPlayback: true,
//                 allowsPictureInPictureMediaPlayback: true,
//               ),
//             ),
//             onWebViewCreated: (InAppWebViewController controller) {
//               webView = controller;
//               if (AppData.device.isAndroid && isYouTube) {
//                 videoId =
//                     liveSatsangVideoList[_selectedTabIndex]?.youtubeVideoId;
//                 webView?.loadData(data: player);
//               } else {
//                 ///Addded below code to reload webview on refresh and onLoad
//                 webView?.loadUrl(
//                   url:
//                       'https://webplayer.akonnect.org/${liveSatsangVideoList[_selectedTabIndex]?.languageName}',
//                   // url: liveSatsangVideoList[_selectedTabIndex]?.videoUrl
//                 );
//               }
//               print("onWebViewCreated");
//             },
//             onLoadStart: (InAppWebViewController controller, String url) {
//               print("onLoadStart $url");
//               setState(() {
//                 // this.url = url;
//               });
//             },
//             shouldOverrideUrlLoading:
//                 (controller, shouldOverrideUrlLoadingRequest) async {
//               var url = shouldOverrideUrlLoadingRequest.url;
//               var uri = Uri.parse(url);
//               print('url ---> $url');
//               print('uri ---> $uri');
//               print('uri.scheme ---> ${uri.scheme}');

//               if (![
//                 "http",
//                 "https",
//                 "file",
//                 "chrome",
//                 "data",
//                 "javascript",
//                 "about"
//               ].contains(uri.scheme)) {
//                 // if (await canLaunch(url)) {
//                 // Launch the App
//                 await launch(
//                   url,
//                 );
//                 // and cancel the request
//                 return ShouldOverrideUrlLoadingAction.CANCEL;
//                 //}
//               }

//               return ShouldOverrideUrlLoadingAction.ALLOW;
//             },
//             onLoadStop: (InAppWebViewController controller, String url) async {
//               print("onLoadStop $url");
//               setState(() {
//                 // this.url = url;
//               });
//             },
//             // onProgressChanged: (InAppWebViewController controller, int progress) {
//             //   setState(() {
//             //     this.progress = progress / 100;
//             //   });
//             // },
//             onUpdateVisitedHistory: (InAppWebViewController controller,
//                 String url, bool androidIsReload) {
//               print("onUpdateVisitedHistory $url");
//               setState(() {
//                 // this.url = url;
//               });
//             },
//             onConsoleMessage: (controller, consoleMessage) {
//               print(consoleMessage?.toString());
//             },
//           ));
//     } else {
//       if (isYouTube) {
//         videoId = liveSatsangVideoList[_selectedTabIndex]?.youtubeVideoId;
//         // videoId = 'N4dUAAGJbl4';
//         print('videoID::::::::::::::::::: $videoId');

//         playerContainer = Container(
//           //margin: const EdgeInsets.all(10.0),
//           height: height,
//           width: width,
//           padding: EdgeInsets.zero,
//           color: Theme.of(context).scaffoldBackgroundColor,
//           child: InAppWebView(
//             onReceivedClientCertRequest: (controller, challenge) {
//               print(
//                   'onReceivedClientCertRequest:-------> ${challenge.toString()} :: ');
//             },
//             initialData: InAppWebViewInitialData(
//               data: player,
//               baseUrl: 'https://www.youtube.com',
//               encoding: 'utf-8',
//               mimeType: 'text/html',
//             ),
//             initialOptions: InAppWebViewGroupOptions(
//               crossPlatform: InAppWebViewOptions(
//                   userAgent: kAndroidUserAgent,
//                   debuggingEnabled: false,
//                   mediaPlaybackRequiresUserGesture: false,
//                   transparentBackground: true,
//                   disableContextMenu: true,
//                   supportZoom: false,
//                   // disableHorizontalScroll: true,
//                   // disableVerticalScroll: true,
//                   useShouldOverrideUrlLoading: true,
//                   javaScriptEnabled: true,
//                   //useShouldOverrideUrlLoading: true,
//                   javaScriptCanOpenWindowsAutomatically: true,
//                   useOnLoadResource: true),
//               ios: IOSInAppWebViewOptions(
//                 allowsInlineMediaPlayback: true,
//                 allowsAirPlayForMediaPlayback: true,
//                 allowsPictureInPictureMediaPlayback: true,
//               ),
//               android: AndroidInAppWebViewOptions(useWideViewPort: false),
//             ),
//             onWebViewCreated: (InAppWebViewController controller) {
//               // print('onWebViewCreated message:-------> ${controller}');
//               webView = controller;
//               _autoPlayYouTube();
//               webView.addJavaScriptHandler(
//                   handlerName: 'handlerStateChange',
//                   callback: (args) {
//                     if ((args == 1) || (args.length > 0 && args[0] == 1)) {
//                       isVideoPlayed = true;
//                     } else if (!isVideoPlayed &&
//                         (args?.length > 0 && args[0] == 2)) {
//                       isVideoPlayed = false;
//                     }
//                     // print('playerInfo ${args}');
//                   });
//             },
//             onConsoleMessage: (InAppWebViewController controller,
//                 ConsoleMessage consoleMessage) {
//               //webView = controller;
//               print('console message:-------> ${consoleMessage.message}');
//             },
//             // onLoadStop: (InAppWebViewController controller, String url) async {
//             //   print("onLoadStop $url");
//             // },
//             onEnterFullscreen: (controller) {
//               //webView = controller;
//               // print('onEnterFullscreen message:-------> ${controller}');
//               SystemChrome.setPreferredOrientations([
//                 DeviceOrientation.landscapeLeft,
//                 DeviceOrientation.landscapeRight,
//               ]);
//             },
//             onExitFullscreen: (controller) {
//               //webView = controller;
//               print(
//                   'onExitFullscreen message:-------> ${controller?.toString}');
//               // SystemChrome.setPreferredOrientations(
//               //     [DeviceOrientation.portraitUp]);
//               // SystemChrome.setPreferredOrientations(DeviceOrientation.values);
//               SystemChrome.setPreferredOrientations([
//                 DeviceOrientation.portraitDown,
//                 DeviceOrientation.portraitUp,
//               ]);
//               SystemChrome.setPreferredOrientations(DeviceOrientation.values);
//               _autoPlayYouTube();
//             },
//           ),
//         );
//       } else {
//         playerContainer = Container(
//           height: height,
//           width: width,
//           padding: EdgeInsets.zero,
//           color: Theme.of(context).scaffoldBackgroundColor,
//           child: InAppWebView(
//             // onReceivedClientCertRequest: (controller, challenge) {
//             //   print('onReceivedClientCertRequest:-------> ${challenge.toString()}');
//             // },

//             initialUrl:
//                 'https://webplayer.akonnect.org/${liveSatsangVideoList[_selectedTabIndex]?.languageName}',
//             // initialUrl: liveSatsangVideoList[_selectedTabIndex].videoUrl,
//             // initialUrl: 'http://webtvtest.dadabhagwan.org/specialsatsang/',
//             //initialUrl: 'http://webtvtest.dadabhagwan.org/specialsatsang1.html',
//             //initialUrl: 'https://www.youtube.com/embed/TQ-1_D8EJSY',
//             initialOptions: InAppWebViewGroupOptions(
//               crossPlatform: InAppWebViewOptions(
//                   userAgent: kAndroidUserAgent,
//                   // debuggingEnabled: false,
//                   mediaPlaybackRequiresUserGesture: false,
//                   transparentBackground: true,
//                   disableContextMenu: true,
//                   supportZoom: false,
//                   useShouldOverrideUrlLoading: true,
//                   javaScriptEnabled: true,
//                   javaScriptCanOpenWindowsAutomatically: true,
//                   useOnLoadResource: true),
//               ios: IOSInAppWebViewOptions(
//                 allowsInlineMediaPlayback: true,
//                 allowsAirPlayForMediaPlayback: true,
//                 allowsPictureInPictureMediaPlayback: true,
//               ),
//               android: AndroidInAppWebViewOptions(useWideViewPort: false),
//             ),
//             onWebViewCreated: (InAppWebViewController controller) {
//               print(
//                   'onWebViewCreated message:-------> ${controller?.toString()}');
//               webView = controller;
//             },
//             onConsoleMessage: (InAppWebViewController controller,
//                 ConsoleMessage consoleMessage) {
//               //webView = controller;
//               print('console message:-------> ${consoleMessage.message}');
//             },
//             onEnterFullscreen: (controller) {
//               //webView = controller;
//               print(
//                   'onEnterFullscreen message:-------> ${controller?.toString()}');
//               SystemChrome.setPreferredOrientations([
//                 DeviceOrientation.landscapeLeft,
//                 DeviceOrientation.landscapeRight,
//               ]);
//             },
//             // onLoadStop: (InAppWebViewController controller, String url) async {
//             //   print("onLoadStop $url");
//             //   // webView?.evaluateJavascript(
//             //   //     source:
//             //   //         "\ setTimeout(function () { console.log('from OnxitFull:landscapeFirst');  try{ if(youTubePlayer.getPlayerState()!==1){console.log('from :::landscapeS'); youTubePlayer.playVideo();console.log('from :::landscapeEND');}} catch(err){console.error('error',err);}  }, 700);");
//             // },
//             onExitFullscreen: (controller) {
//               //webView = controller;
//               print(
//                   'onExitFullscreen message:-------> ${controller?.toString()}');
//               // SystemChrome.setPreferredOrientations(
//               //     [DeviceOrientation.portraitUp]);
//               // SystemChrome.setPreferredOrientations(DeviceOrientation.values);
//               SystemChrome.setPreferredOrientations([
//                 DeviceOrientation.portraitDown,
//                 DeviceOrientation.portraitUp,
//               ]);
//               SystemChrome.setPreferredOrientations(DeviceOrientation.values);
//               // _autoPlayYouTube();
//             },
//           ),
//         );
//       }
//     }
//     return playerContainer;
//   }

//   String get player => '''
//     <!DOCTYPE html>
//     <html>
//     $playerDocHead
//     <body>
//         <div id="player"></div>
//         <script>
//             var player;
//             var timerId;
//             var isPlay=$isVideoPlayed;
//             function onYouTubeIframeAPIReady() {
//                 player = YT.Player('player', {
//                     height: '100%',
//                     width: '100%',
//                     videoId: '$videoId',
//                     playerVars: ${playerVars(true)},
//                     events: {
//                         onReady: function(event) {console.log("call hede Top Menuwewewewewwew####@@@@"); window.flutter_inappwebview.callHandler('Ready'); console.log("call hede Top Menu"); hideTopMenu(); hidePauseOverlay();  },
//                         onStateChange: function(event) { sendPlayerStateChange(event.data);if(isPlay){console.log("this si AMEJ.com@@State"); play();}  },
//                         onPlaybackQualityChange: function(event) { window.flutter_inappwebview.callHandler('PlaybackQualityChange', event.data);   },
//                         onPlaybackRateChange: function(event) { window.flutter_inappwebview.callHandler('PlaybackRateChange', event.data);  },
//                         onError: function(error) { window.flutter_inappwebview.callHandler('Errors', error.data);  }
//                     },
//                 });
//             }
//             function sendPlayerStateChange(playerState) {
//                 clearTimeout(timerId);
//                 window.flutter_inappwebview.callHandler('handlerStateChange', playerState);
//                 if (playerState == 1) {
//                     isPlay=true;
//                     startSendCurrentTimeInterval();
//                     sendVideoData(player);
//                 }
//                 if(playerState == 2) {
//                   isPlay=false;
//                   }
//                 // else{
//                 //   isPlay=false;
//                 // }
//                   console.log('isPlay',isPlay);
//             }
//             function sendVideoData(player) {
//                 var videoData = {
//                     'duration': player.getDuration(),
//                     'title': player.getVideoData().title,
//                     'author': player.getVideoData().author,
//                     'videoId': player.getVideoData().video_id
//                 };
//                 window.flutter_inappwebview.callHandler('VideoData', videoData);
//             }
//             function startSendCurrentTimeInterval() {
//                 timerId = setInterval(function () {
//                     window.flutter_inappwebview.callHandler('VideoTime', player.getCurrentTime(), player.getVideoLoadedFraction());
//                 }, 100);
//             }
//             $youtubeIFrameFunctions
//         </script>
//     </body>
//     </html>''';
// }
