import 'package:dadabhagwan_tv/common/app_data.dart';
import 'package:dadabhagwan_tv/common/app_data.dart';
import 'package:dadabhagwan_tv/common/utils.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class IframeYoutubePlayer extends StatefulWidget {
  final String videoURL;
  final int startFrom;
  final DateTime responseTime;
  final bool showYouTubeControls;

  const IframeYoutubePlayer({
    Key key,
    @required this.videoURL,
    @required this.startFrom,
    @required this.responseTime,
    @required this.showYouTubeControls,
  }) : super(key: key);

  @override
  _IframeYoutubePlayerState createState() => _IframeYoutubePlayerState();
}

class _IframeYoutubePlayerState extends State<IframeYoutubePlayer> {
  YoutubePlayerController _controller;
  bool isFocusPlayButton = false;

  // Widget controls() {
  //   return Container(
  //     color: isFocusPlayButton ? Colors.black54 : Colors.transparent,
  //     padding: const EdgeInsets.all(16),
  //     child: Center(
  //       child: YoutubeValueBuilder(
  //         controller: _controller,
  //         builder: (context, value) {
  //           return Row(
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
  //             children: [
  //               InkWell(
  //                 onFocusChange: (value) {
  //                   setState(() {
  //                     isFocusPlayButton = value ?? false;
  //                   });
  //                 },
  //                 child: Opacity(
  //                   opacity: value.playerState != PlayerState.playing
  //                       ? 1
  //                       : isFocusPlayButton
  //                           ? 1
  //                           : 0,
  //                   child: FloatingActionButton(
  //                     focusColor: Colors.amber.shade900,
  //                     onPressed: value.isReady
  //                         ? () {
  //                             value.playerState == PlayerState.playing
  //                                 ? context.ytController.pause()
  //                                 : context.ytController.play();
  //                           }
  //                         : null,
  //                     child: Icon(
  //                       value.playerState == PlayerState.playing
  //                           ? Icons.pause
  //                           : Icons.play_arrow,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }

  void initYoutubePlayer() {
    String videoId = widget.videoURL.split("/").last;
    print("videoId $videoId");
    _controller = YoutubePlayerController(
      // initialVideoId: videoId,
      initialVideoId: 'PqSciXewTeU',// Flickering YT video,
      // initialVideoId: 'VGKwJlj6oqE',// Pujyashree at Trimandir after Lockdown,
      // initialVideoId: '2sgwUMv2uws',// Aarti,
      /// log give
      /// E/chromium( 6194): [ERROR:image_reader_gl_owner.cc(316)] no buffers currently available in the reader queue
      
      // initialVideoId: 'Y5NykhC2m4Y',// Non Flickering,

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
        DateTime now = DateTime.now();
        int errorTime = now.difference(widget.responseTime).inSeconds;
        print("errorTime: $errorTime");
        // _controller.seekTo(Duration(seconds: widget.startFrom + errorTime));
        _controller.seekTo(Duration(seconds: 24));
        _controller.play();
        // _controller.hidePauseOverlay();
        // _controller.hideTopMenu();
        // Future.delayed(Duration(seconds: 15), () {
        //   Utils.showToast("#YT_PLV: ${_controller.value.toString()}");
        // });
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

  static const player = YoutubePlayerIFrame();
  final Key playerKey = ValueKey('IframeYoutubePlayer_dada');

  @override
  Widget build(BuildContext context) {
    print('#BUILD IframeYoutubePlayer: ' + DateTime.now().toIso8601String());
    return YoutubePlayerControllerProvider(
      key: playerKey,
      controller: _controller,
      // child: player,
      child: const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: player),
      ),
    );
  }
}
