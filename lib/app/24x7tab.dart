// import 'dart:async';

// import 'package:dadabhagwan_tv/api/apiservice.dart';
// import 'package:dadabhagwan_tv/app/web_iframe.dart';
// import 'package:dadabhagwan_tv/app/youtube_player_iframe.dart';
// import 'package:dadabhagwan_tv/common/app_data.dart';
// import 'package:dadabhagwan_tv/common/constants.dart';
// import 'package:dadabhagwan_tv/models/CurTvProgramModel.dart';
// import 'package:dadabhagwan_tv/models/TVScheduleModel.dart';
// import 'package:flutter/material.dart';

// class T4x7LiveTab extends StatefulWidget {
//   final Language language;

//   const T4x7LiveTab({Key key, @required this.language}) : super(key: key);
//   @override
//   _T4x7LiveTabState createState() => _T4x7LiveTabState();
// }

// class _T4x7LiveTabState extends State<T4x7LiveTab> {
//   bool isLoading = true;
//   bool isYoutube;
//   int startFrom = 0;
//   Timer timer;
//   CurTVProgramModel curTVProgramModel;
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

//   Future getVideoData() async {
//     showLoader();
//     try {
//       timer?.cancel();
//       startFrom = 0;
//       curTVProgramModel = await APIService.getCurrentVideo(widget.language);

//       responseTime = DateTime.now();

//       if (curTVProgramModel?.yOUTUBEEMBEDCODE != "") {
//         isYoutube = true;
//       } else {
//         isYoutube = false;
//       }

//       Tvschedule tvschedule = AppData.currentLanguageTvSchedule
//           .where(
//               (element) => element.webTvScheduleId == curTVProgramModel.tVSCHID)
//           .first;

//       /// If it is the last program of the day; then reset current days schedule
//       /// list so as to fetch the next days schedule
//       if (AppData.currentLanguageTvSchedule.last.webTvScheduleId ==
//           curTVProgramModel.tVSCHID) {
//         AppData.currentLanguageTvSchedule = [];
//       }

//       List<String> startDuationInString = tvschedule.duration.split(":");

//       Duration totalVideoDuration = Duration(
//         hours: int.parse(startDuationInString[0]),
//         minutes: int.parse(startDuationInString[1]),
//         seconds: int.parse(startDuationInString[2]),
//       );

//       startFrom =
//           totalVideoDuration.inSeconds - int.parse(curTVProgramModel.duration);

//       print("curTVProgramModel?.vIDEOPATH ${curTVProgramModel.vIDEOURL}");
//       print("Start From:  $startFrom");

//       timer = Timer(
//         Duration(
//           seconds: int.parse(curTVProgramModel.duration),
//         ),
//         () async {
//           getVideoData();
//         },
//       );
//     } catch (e) {
//       print('$e');
//     }
//     hideLoader();
//   }

//   Widget loader() {
//     return Center(
//       child: CircularProgressIndicator(),
//     );
//   }

//   Widget tabData() {
//     return isYoutube != null
//         ? Center(
//             child: isYoutube
//                 ? IframeYoutubePlayer(
//                     videoURL: curTVProgramModel.vIDEOURL,
//                     startFrom: startFrom,
//                     responseTime: responseTime,
//                     showYouTubeControls: true,
//                   )
//                 : WebIframe(
//                     videoURL: curTVProgramModel.vIDEOURL,
//                     startFrom: startFrom,
//                     responseTime: responseTime,
//                   ),
//           )
//         : Container();
//   }

//   @override
//   void initState() {
//     super.initState();
//     getVideoData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: isLoading ? loader() : tabData(),
//       ),
//     );
//   }
// }
