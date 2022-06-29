import 'package:dadabhagwan_tv/common/constants.dart';
import 'package:dadabhagwan_tv/models/app_change_notifier_provider.dart';
import 'package:dadabhagwan_tv/services/init_app_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  InitAppService.initApp().then((_) {
    runApp(DadaBhagwanTvApp());
  });
}

class DadaBhagwanTvApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.select): ActivateIntent(),
      },
      child: StyledToast(
        locale: const Locale('en', 'US'),
        textStyle: TextStyle(fontSize: 16.0, color: Colors.white),
        backgroundColor: Color(0x99000000),
        borderRadius: BorderRadius.circular(5.0),
        textPadding: EdgeInsets.symmetric(horizontal: 17.0, vertical: 10.0),
        toastPositions: StyledToastPosition.top,
        toastAnimation: StyledToastAnimation.fade,
        reverseAnimation: StyledToastAnimation.fade,
        curve: Curves.fastOutSlowIn,
        reverseCurve: Curves.fastLinearToSlowEaseIn,
        duration: Duration(seconds: 4),
        animDuration: Duration(seconds: 1),
        dismissOtherOnShow: true,
        // movingOnWindowChange: true,
        child: MaterialApp(
          title: 'DadaBhagwan TV App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: Brightness.dark,
          ),
          home: MultiProvider(
            providers: [
              ChangeNotifierProvider(
                  create: (context) => AppChangeNotifierProvider()),
              // Provider(create: (context) => SomeOtherClass()),
            ],
            child: TestYtPlayer(), // TestYtPlayer(), // App(),
          ),
        ),
      ),
    );
  }
}

class TestYtPlayer extends StatefulWidget {
  @override
  _TestYtPlayerState createState() => _TestYtPlayerState();
}

class _TestYtPlayerState extends State<TestYtPlayer> {
  YoutubePlayerController _controller;
  // String videoURL =  'https://www.youtube.com/embed/x14nWLcbYIw'; Constants.testYoutubeVideoUrl;// '';
  // String videoURL =
  //     'https://www.youtube.com/embed/CPfUuii717g?start=24&autoplay=1'; // Constants.testYoutubeVideoUrl;// '';

  void initYoutubePlayer() {
    String videoId = 'CPfUuii717g';
    //   'x14nWLcbYIw';
    // videoURL.split("/").last;
    videoId = 'PqSciXewTeU'; //flicker
    
    print("videoId $videoId");
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      // params: //const
      //     YoutubePlayerParams(
      //   autoPlay: true,

      //   desktopMode: false,//widget.showYouTubeControls, // quality controls

      //   showControls: false,// widget.showYouTubeControls, // true,
      //   showFullscreenButton: false,

      //   strictRelatedVideos: true,

      //   /// https://github.com/flutter/flutter/wiki/Hybrid-Composition#performance
      //   //useHybridComposition:
      //   //    false, // AppData.currPhysicalDevice.androidSdkVersion >= 30 ,
      //   // On MiTv with android 9, false flickers the youtube video
      //   // On FireStick with android 9, true flickers the youtube video
      //   // Hence handle conditionally
      //   useHybridComposition: AppData.currPhysicalDevice.isAndroidOs, // true,
      //   // enableKeyboard: true,
      //   // desktopMode: false,
      //   // privacyEnhanced: true,
      //   // useHybridComposition: true,

      //   // enableKeyboard: false,
      // ),

      params: const YoutubePlayerParams(
        autoPlay: true,
        showControls: false,
        showFullscreenButton: false,

        // showControls: true,
        // showFullscreenButton: true,
        strictRelatedVideos: true,

        // showControls: true,
        // showFullscreenButton: true,

        // enableKeyboard: true,
        // desktopMode: false,
        // privacyEnhanced: true,
        // useHybridComposition: true,
        useHybridComposition: true,

        desktopMode: false, // quality controls
        // enableKeyboard: false,
      ),
    );
    _controller.stream.first.then(
      (value) {
        // _controller.seekTo(Duration(seconds: 0));
        _controller.play();
        _controller.hidePauseOverlay();
        _controller.hideTopMenu();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    initYoutubePlayer();
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  // @override
  // void deactivate() {
  //   super.deactivate();
  // }

  @override
  Widget build(BuildContext context) {
    const player = YoutubePlayerIFrame();
    return YoutubePlayerControllerProvider(
      controller: _controller,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: player),
      ),
    );
  }
}
