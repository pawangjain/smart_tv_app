// import 'dart:core';
// import 'package:dadabhagwan_tv/api/apiservice.dart';
// import 'package:dadabhagwan_tv/app/app.dart';
// import 'package:dadabhagwan_tv/app/special_satsang_player.dart';
// import 'package:dadabhagwan_tv/common/app_data.dart';
// import 'package:dadabhagwan_tv/common/constants.dart';
// import 'package:dadabhagwan_tv/common/link_text.dart';
// import 'package:dadabhagwan_tv/common/utils.dart';
// import 'package:dadabhagwan_tv/models/LiveInfoModel.dart';
// import 'package:dadabhagwan_tv/services/shared_preferences_service.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class SettingsPage extends StatefulWidget {
//   @override
//   _SettingsPageState createState() => _SettingsPageState();
// }

// class _SettingsPageState extends State<SettingsPage> {
//   // ignore: non_constant_identifier_names
//   List<String> _24x7TvLangNameList = Constants.languageValues.map.keys
//       .toList(); // ['Gujarati', 'Hindi', 'English'];
//   List<String> _liveLangNameList = [
//     'Gujarati',
//     'Hindi',
//     'English',
//     'German',
//     'Spanish',
//     'Portuguese'
//   ];

//   // bool useYoutubeAppForLiveSsg;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Center(
//               child: Container(
//                 width: 468,
//                 child: Column(
//                   children: [
//                     Column(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Text(
//                           'Settings',
//                           style: TextStyle(fontSize: 28),
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           'Version - ' + AppData.currPhysicalDevice.appVersion,
//                           style: TextStyle(fontSize: 14),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 16,
//                     ),
//                     Center(
//                       child: ListTile(
//                         title: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text('Web TV Preffered Language'
//                                 // 'No results found.'
//                                 ),
//                             languageDropdown(isLiveTvDropdown: false),
//                           ],
//                         ),
//                         // subtitle: Text('Enter 3 or more characters to search'),
//                         leading: Icon(Icons.live_tv),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 14,
//                     ),
//                     Center(
//                       child: ListTile(
//                         title: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text('Live Preffered Language'
//                                 // 'No results found.'
//                                 ),
//                             languageDropdown(isLiveTvDropdown: true),
//                           ],
//                         ),
//                         // subtitle: Text('Enter 3 or more characters to search'),
//                         leading: Icon(Icons.language_rounded),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 14,
//                     ),
//                     AppData.currPhysicalDevice.isAndroidOs
//                         ? Center(
//                             child: ListTile(
//                               title: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text('Open Live Satsang in YouTube App'
//                                       // 'No results found.'
//                                       ),
//                                   Switch(
//                                     activeColor: Constants.highlightColor,
//                                     value: AppData.useYoutubeAppForLiveSsg,
//                                     onChanged: (value) {
//                                       setState(() {
//                                         AppData.useYoutubeAppForLiveSsg = value;

//                                         SharedPreferencesService.setBool(
//                                           SharedPrefConstants
//                                               .USE_YOUTUBE_APP_FOR_LIVE_SSG,
//                                           value,
//                                         );

//                                         APIService.sendStats(
//                                             SharedPrefConstants
//                                                 .USE_YOUTUBE_APP_FOR_LIVE_SSG,
//                                             {'useYoutubeAppForLiveSsg': value});

//                                         print(AppData.useYoutubeAppForLiveSsg);
//                                       });
//                                     },
//                                   ),
//                                 ],
//                               ),
//                               // subtitle: Text('Enter 3 or more characters to search'),
//                               leading: Icon(FontAwesomeIcons.youtube),
//                             ),
//                           )
//                         : SizedBox(),
//                     Column(
//                       children: [
//                         SizedBox(
//                           height: 24,
//                         ),
//                         Text(
//                           'In case of any issues, please email the details along with screenshots to:',
//                           //  style: TextStyle(fontSize: 14),
//                         ),
//                         SizedBox(
//                           height: 7,
//                         ),
//                         LinkText(
//                           text: Constants.supportEmailId,
//                           url: 'mailto:' + Constants.supportEmailId,
//                         ),
//                       ],
//                     ),
//                     _buildWrapTest()
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   _buildWrapTest() {
//     // return SizedBox();
//     return Wrap(
//       children: [
//         SizedBox(),
//         Text('\n' + AppData.currPhysicalDevice.toString() + '\n'),
//         ElevatedButton(
//           onPressed: () async {
//             Utils.openWebViewPage(context, 'https://www.youtube.com/embed/PqSciXewTeU?autoplay=1');
//           },
//           child: Text('yt flicker'),
//         ),
//         ElevatedButton(
//           onPressed: () async {
//             testSplPlayer();
//           },
//           child: Text('testSplPlayer()'),
//         ),
//         ElevatedButton(
//           onPressed: () async {
//             Utils.showAlert(
//               closeable: false,
//               context: context,
//               title: 'Update is available',
//               msg:
//                   'New version is available with enhanced features.\n\nPlease click on the "Update Now" button to update it from the app store.',
//               doneButtonText: 'Update Now',
//               doneButtonFn: () {
//                 Utils.launchURL(AppData.currPhysicalDevice.appStoreUrl);
//               },
//               showCancelButton: true,
//               cancelButtonText: 'Remind Later',
//               // doneCancelFn: () {
//               //   // _onRemindMeLaterPressed();
//               // },
//             );

//             // Utils.showAlert(
//             //   context: context,
//             //   msg: 'dadadada',
//             //   title: 'ok?',
//             //   showCancelButton: true,
//             // );
//             // Utils.launchYoutubeAppIntent(
//             //     Constants.testYoutubeVideoUrl);
//           },
//           child: Text('update test'),
//         ),
//         ElevatedButton(
//           onPressed: () async {
//             Utils.launchYoutubeAppIntent(Constants.testYoutubeVideoUrl);
//           },
//           child: Text('Launch Android TV Youtube App Intent'),
//         ),
//         ElevatedButton(
//           onPressed: () async {
//             // Utils.launchYoutubeAppIntent(
//             //     Constants.testYoutubeVideoUrl, 'com.amazon.firetv.youtube');
//           },
//           child: Text('Launch FireOS Youtube App Intent'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             Utils.launchURL(Constants.testSpecialVideoUrl);
//           },
//           child: Text('Special Ssg External App'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             Utils.openWebViewPage(context, Constants.testSpecialVideoUrl);
//           },
//           child: Text('Special Ssg Webview'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             Utils.openWebViewPage(context, Constants.testYoutubeVideoUrl);
//           },
//           child: Text('Youtube WebView'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             Utils.openWebViewPage(context, Constants.testVimeoVideoUrl);
//           },
//           child: Text('Vimeo WebView'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             Utils.launchURL(Constants.testYoutubeVideoUrl);
//           },
//           child: Text('Youtube site URL'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             Utils.launchURL(Constants.testVimeoVideoUrl);
//           },
//           child: Text('Vimeo site URL'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             Utils.launchURL(
//               'https://m.youtube.com/watch?v=x14nWLcbYIw',
//             );
//           },
//           child: Text('Youtube Mobile site URL'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             Utils.launchURL('https://www.youtube.com/watch?v=x14nWLcbYIw');
//           },
//           child: Text('Launch Youtube App'),
//         ),
//       ],
//     );
//   }

//   String dropdownValue;

//   Widget languageDropdown({bool isLiveTvDropdown = false}) {
//     List<String> languageList;
//     if (isLiveTvDropdown) {
//       languageList = _liveLangNameList;
//     } else {
//       languageList = _24x7TvLangNameList;
//     }

//     return Container(
//       child: Container(
//         width: 110,
//         decoration: const BoxDecoration(
//           border: Border(
//             bottom: BorderSide(
//               color: Color(0xFFBDBDBD),
//               width: 0.0,
//             ),
//           ),
//         ),
//         // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
//         // decoration: BoxDecoration(
//         //   color: Colors.black,
//         //   borderRadius: BorderRadius.circular(30),
//         //   border: Border.all(
//         //     width: 1,
//         //     // color: Theme.of(context).scaffoldBackgroundColor,
//         //     color: Colors.grey,
//         //   ),
//         // ),

//         child: DropdownButtonHideUnderline(
//           child: DropdownButton<String>(
//             value: isLiveTvDropdown
//                 ? AppData.livePreferredLanguage
//                 : AppData.webTv24x7PreferredLanguage,
//             // focusColor: Colors.amber.shade900,
//             items: languageList.map((String language) {
//               return DropdownMenuItem<String>(
//                 value: language,
//                 child: Text(language),
//               );
//             }).toList(),
//             // selectedItemBuilder: (context) => ,
//             /// TODO: give padding
//             onChanged: (String value) async {
//               String sharedPrefSettingKey;

//               if (isLiveTvDropdown) {
//                 AppData.livePreferredLanguage = value;
//                 sharedPrefSettingKey =
//                     SharedPrefConstants.LIVE_PREFERRED_LANGUAGE;
//               } else {
//                 AppData.webTv24x7PreferredLanguage = value;
//                 sharedPrefSettingKey =
//                     SharedPrefConstants.WEBTV_24X7_PREFERRED_LANGUAGE;
//               }

//               SharedPreferencesService.setString(
//                 sharedPrefSettingKey,
//                 value,
//               );

//               APIService.sendStats(sharedPrefSettingKey, {'language': value});

//               setState(() {});
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   testSplPlayer() {
//     final splSsgList = [
//       {
//         "languageName": "Gujarati",
//         "youtubeVideoId": "Boq5AMjHbfA",
//         "languageId": 1,
//         "embedCode":
//             "<iframe src=\"https://www.youtube.com/embed/Boq5AMjHbfA?rel=0\" height=\"315\" width=\"560\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>",
//         "videoUrl": "https://www.youtube.com/embed/Boq5AMjHbfA?rel=0",
//         "languageOrder": 1,
//         "isAutoPlay": true,
//         "isRedirectToYouTube": true,
//         "translation": false,
//         "eventTitle": "LIVE Satsang in Gujarati - 1 September 2021",
//         "eventDate": "01 September 2021",
//         "startTime": "09:00 PM",
//         "endTime": "10:00 PM"
//       },
//       {
//         "languageName": "Hindi",
//         "youtubeVideoId": "m0haWnUrq3A",
//         "languageId": 2,
//         "embedCode":
//             "<iframe src=\"https://www.youtube.com/embed/m0haWnUrq3A?rel=0\" height=\"315\" width=\"560\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>",
//         "videoUrl": "https://www.youtube.com/embed/m0haWnUrq3A?rel=0",
//         "languageOrder": 2,
//         "isAutoPlay": true,
//         "isRedirectToYouTube": true,
//         "translation": true,
//         "eventTitle": "LIVE Satsang - Hindi Translation - 1 September 2021",
//         "eventDate": "01 September 2021",
//         "startTime": "09:00 PM",
//         "endTime": "10:00 PM"
//       },
//       {
//         "languageName": "English",
//         "youtubeVideoId": "smoDGsE23h4",
//         "languageId": 3,
//         "embedCode":
//             "<iframe src=\"https://www.youtube.com/embed/smoDGsE23h4?rel=0\" height=\"315\" width=\"560\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>",
//         "videoUrl": "https://www.youtube.com/embed/smoDGsE23h4?rel=0",
//         "languageOrder": 3,
//         "isAutoPlay": true,
//         "isRedirectToYouTube": true,
//         "translation": true,
//         "eventTitle": "LIVE Satsang - English Translation - 1 September 2021",
//         "eventDate": "01 September 2021",
//         "startTime": "09:00 PM",
//         "endTime": "10:00 PM"
//       },
//       {
//         ///aarti
//         "languageName": "Gujarati",
//         "youtubeVideoId": "",
//         "languageId": 1,
//         "embedCode":
//             "<iframe src=\"https://www.dadabhagwan.tv/specialsatsang/gujarati/\" height=\"250px\" width=\"100%\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>",
//         "videoUrl": "https://www.dadabhagwan.tv/specialsatsang/gujarati/",
//         "languageOrder": 1,
//         "isAutoPlay": true,
//         "isRedirectToYouTube": false,
//         "translation": false,
//         "eventTitle": "All Aarti",
//         "eventDate": "01 September 2021",
//         "startTime": "",
//         "endTime": "",
//       }
//     ];

//     List<LiveSatsangVideo> liveSatsangVideoList = List<LiveSatsangVideo>.from(
//         splSsgList.map((x) => LiveSatsangVideo.fromJson(x)));

//     Navigator.of(context).push(
//       MaterialPageRoute<Null>(
//         builder: (BuildContext context) {
//           return SpecialSatsangPlayer(
//             liveOrSpecialSatsangVideo: liveSatsangVideoList[0],
//           );
//         },
//         fullscreenDialog: true,
//       ),
//     );
//   }
// }
