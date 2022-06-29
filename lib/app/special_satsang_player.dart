// import 'dart:async';
// import 'package:dadabhagwan_tv/api/apiservice.dart';
// import 'package:dadabhagwan_tv/app/web_iframe.dart';
// import 'package:dadabhagwan_tv/app/youtube_player_iframe.dart';
// import 'package:dadabhagwan_tv/models/LiveInfoModel.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class SpecialSatsangPlayer extends StatefulWidget {
//   final LiveSatsangVideo liveOrSpecialSatsangVideo;

//   const SpecialSatsangPlayer(
//       {Key key, @required this.liveOrSpecialSatsangVideo})
//       : super(key: key);
//   @override
//   _SpecialSatsangPlayerState createState() => _SpecialSatsangPlayerState();
// }

// class _SpecialSatsangPlayerState extends State<SpecialSatsangPlayer> {
//   bool isLoading = true;
//   int startFrom = 0;
//   DateTime responseTime;

//   void showLoader() {
//     setState(() {
//       isLoading = true;
//     });
//   }

//   void hideLoader() {
//     setState(() {
//       isLoading = false;
//     });
//   }

//   Widget loader() {
//     return Center(
//       child: CircularProgressIndicator(),
//     );
//   }

//   Future getTimeDifference() async {
//     showLoader();
//     try {
//       startFrom = 0;
//       String indianTimeStr = await APIService.getIndianTime();

//       responseTime = DateTime.now();

//       // final startTimeFormat = DateFormat('HH:mm a');
//       final twentfourHourTimeFormat = DateFormat('HH:mm:ss');

//       DateTime videoStartTime =
//           twentfourHourTimeFormat.parse(widget.liveOrSpecialSatsangVideo.startTime);
//       DateTime videoEndTime =
//           twentfourHourTimeFormat.parse(widget.liveOrSpecialSatsangVideo.endTime);

//       DateTime indiaTimeNow = twentfourHourTimeFormat.parse(indianTimeStr);

//       if (videoEndTime.isBefore(videoStartTime)) {
//         /// Which means midnight event and has crossed next day
//         videoEndTime.add(Duration(days: 1));
//         // indiaTimeNow.add(Duration(days: 1));
//       }

//       int videoDurationInSec =
//           videoEndTime.difference(videoStartTime).inSeconds;

//       startFrom = indiaTimeNow.difference(videoStartTime).inSeconds;

//       if (startFrom < 0) {
//         startFrom = 0;
//       }

//       print(
//           "#startTime:  ${videoStartTime.toString()}, #indiaTime:  ${indiaTimeNow.toString()}, #timeDiffInSec: $startFrom");
//     } catch (e) {
//       startFrom = 0;
//       print('#EXC getTimeDifference $e');
//     }
//     hideLoader();
//   }

//   Widget tabData() {
//     return widget.liveOrSpecialSatsangVideo.isRedirectToYouTube ?? false
//         ? IframeYoutubePlayer(
//             videoURL: widget.liveOrSpecialSatsangVideo.videoUrl,
//             startFrom: startFrom,
//             responseTime: responseTime,
//             showYouTubeControls: false,
//           )
//         : WebIframe(
//             videoURL: widget.liveOrSpecialSatsangVideo.videoUrl,
//             startFrom: startFrom,
//             responseTime: responseTime,
//           );
//   }

//   @override
//   void initState() {
//     super.initState();
//     getTimeDifference();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         // child: ElevatedButton(
//         //     onPressed: () {
//         //       getTimeDifference();
//         //     },
//         //     child: Text('getTimeDifference')),
//         child: isLoading ? loader() : tabData(),
//       ),
//     );
//   }
// }
