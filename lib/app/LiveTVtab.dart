// import 'package:dadabhagwan_tv/api/apiservice.dart';
// import 'package:dadabhagwan_tv/app/24x7tab.dart';
// import 'package:dadabhagwan_tv/app/special_satsang_player.dart';
// import 'package:dadabhagwan_tv/common/app_data.dart';
// import 'package:dadabhagwan_tv/common/constants.dart';
// import 'package:dadabhagwan_tv/common/utils.dart';
// import 'package:dadabhagwan_tv/models/LiveInfoModel.dart';
// import 'package:flutter/material.dart';

// class LiveTVTabPage extends StatefulWidget {
//   @override
//   _LiveTVTabPageState createState() => _LiveTVTabPageState();
// }

// class _LiveTVTabPageState extends State<LiveTVTabPage> {
//   String isFoucsLang;
//   String selectedLanguage;
//   String bgImgFileName;

//   List<String> currentTabLanguageList;

//   @override
//   void initState() {
//     super.initState();
//     AppData.currentFirstLangFocusNode = AppData.firstWebTvLangFocusNode;
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   void showError(String value) {
//     final snackBar = SnackBar(
//       content: Text('$value'),
//       backgroundColor: Colors.red,
//     );
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }

//   void onFocus(String language) {
//     setState(() {
//       isFoucsLang = language;
//     });
//   }

//   void onClickLanguageCard(String language) {
//     print('Selected Language: $language');
//     selectedLanguage = language;

//     setState(() {});

//     // return;

//     if (AppData.currentTabIndex == TabIndex.TV) {
//       AppData.currentLanguageTvSchedule = [];
//       // openT4Page(Constants.languageValues.map[selectedLanguage]);


//       Navigator.of(context).push(
//         MaterialPageRoute<Null>(
//           builder: (BuildContext context) {
//             return T4x7LiveTab(
//               language: Constants.languageValues.map[selectedLanguage],
//             );
//           },
//           fullscreenDialog: true,
//         ),
//       );
//     } else {
//       LiveSatsangVideo selectedLiveSatsangVideo = AppData
//           .liveInfo.liveSatsangVideoList
//           .firstWhere((e) => e.languageName == selectedLanguage);

//       if (AppData.liveInfo.isSpecial) {
//         /// : play in-app webview or launch it in external app?

//         /// Open special video in inapp browser or launch it in external app?
//         /// Since constant Special video URL
//         /// https://www.dadabhagwan.tv/specialsatsang/gujarati/
//         /// https://webplayer.akonnect.org/gujarati/
//         ///
//         /// Special ssg video
//         /// pass selected lang's live url in below method
//         // Utils.launchURL(selectedLiveSatsangVideo.videoUrl);
     

//         /// Handover the Launching of video urls to external system app / app chooser
//         // Utils.launchURL(selectedLiveSatsangVideo.videoUrl);
//         /// Open Special Satsang Videos in InAppWebView
//         //// Utils.openWebViewPage(context, selectedLiveSatsangVideo.videoUrl);

//         Navigator.of(context).push(
//           MaterialPageRoute<Null>(
//             builder: (BuildContext context) {
//               return SpecialSatsangPlayer(
//                 liveOrSpecialSatsangVideo: selectedLiveSatsangVideo,
//               );
//             },
//             fullscreenDialog: true,
//           ),
//         );
//       } else {
//         // /// Launch Pshri Live youtube urls in external system app
//         //
//         /// /// Launch Pshri Live youtube urls in system Youtube app
//         //

//         /// Handover the Launching of video urls to external system app / app chooser
//         /// NOTE: videoUrl should be a page which WILL autoplay the video, since
//         /// on the InAppWebView there is NO navigation possible using the
//         /// D-pad
//         ///
//         if (AppData.useYoutubeAppForLiveSsg &&
//             AppData.currPhysicalDevice.isAndroidOs &&
//             !Utils.isNullOrEmpty(selectedLiveSatsangVideo.youtubeVideoId)) {
//           /// wont work on firetv
//           Utils.launchYoutubeAppIntent(selectedLiveSatsangVideo.videoUrl);
//           // Utils.launchURL(selectedLiveSatsangVideo.videoUrl);
//           /// vnd. works only in mobile
//           // Utils.launchURL(
//           //     'vnd.youtube:${selectedLiveSatsangVideo.youtubeVideoId}');
//         } else {
//           /// Convert to youtube mobile url so to force the invocation of app selection
//           /// else youtube app is opened by default for yt links
//           // String ytMobileUrl =
//           //     selectedLiveSatsangVideo.videoUrl.replaceAll('www.youtu', 'm.youtu');
//           // print('#ytURL = $ytMobileUrl');
//           // Utils.launchURL(ytMobileUrl);
//           Utils.launchURL(selectedLiveSatsangVideo.videoUrl);
//           // Utils.launchYoutubeAppIntent(selectedLiveSatsangVideo.videoUrl);

//         }
//       }
//     }
//   }

//   // void openT4Page(Language language) {
//   //   Navigator.of(context).push(
//   //     MaterialPageRoute<Null>(
//   //       builder: (BuildContext context) {
//   //         return T4x7LiveTab(
//   //           language: language,
//   //         );
//   //       },
//   //       fullscreenDialog: true,
//   //     ),
//   //   );
//   // }

//   /// Language single Card
//   Widget _buildLanuageCard(String language, int index) {
//     const double radius = 20;
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
//       height: MediaQuery.of(context).size.height / 5,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(radius),
//         border: Border.all(
//           color: isFoucsLang == language
//               ? Constants.languageColorMap[language]
//               : Colors.transparent,
//         ),
//       ),
//       child: Material(
//         borderRadius: BorderRadius.circular(radius),
//         child: InkWell(
//           focusNode: index == 0 ? AppData.currentFirstLangFocusNode : null,
//           autofocus: true,
//           onTap: () {
//             onClickLanguageCard(language);
//           },
//           child: Image(
//             image: AssetImage('images/${language.toLowerCase()}.png'),
//           ),
//           onFocusChange: (value) {
//             onFocus(language);
//             if (!value) {
//               setState(() {
//                 isFoucsLang = null;
//               });
//             }
//           },
//           borderRadius: BorderRadius.circular(radius),
//         ),
//         color: Colors.transparent,
//       ),
//     );
//   }

//   Widget _buildTabContentPage() {
//     String bgImgPath = 'images/$bgImgFileName';
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.only(top: 95, bottom: 80),
//       height: MediaQuery.of(context).size.height,
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           alignment: Alignment.topCenter,
//           fit: BoxFit.cover,
//           image: AssetImage(bgImgPath),
//         ),
//       ),
//       child: ListView(
//         children: [
//           Container(
//             // constraints: BoxConstraints(
//             //   maxHeight: MediaQuery.of(context).size.height - 50,
//             // ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: currentTabLanguageList.isNotEmpty
//                   // ? currentTabLanguageList.map((e) => lanuageCard(e)).toList()
//                   ? _getLanguageCardList()
//                   : [
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: Padding(
//                           padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
//                           child: Text(
//                             'There are no programs yet!\nPlease check the Schedule.',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontStyle: FontStyle.italic,
//                               height: 1.5,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//               // children: [
//               //   // Text(AppData.currentTabIndex, style: TextStyle(fontSize: 31, color: Colors.red,),),
//               //   lanuageCard('English'),
//               //   lanuageCard('Gujarati'),
//               //   lanuageCard('Hindi'),
//               // ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   List<Widget> _getLanguageCardList() {
//     List<Widget> languageCardList = [];

//     for (int i = 0, len = currentTabLanguageList.length; i < len; i++) {
//       languageCardList.add(_buildLanuageCard(currentTabLanguageList[i], i));
//     }

//     return languageCardList;
//   }

//   @override
//   Widget build(BuildContext context) {
//     switch (AppData.currentTabIndex) {
//       case TabIndex.TV:
//         currentTabLanguageList = Languages.sortLanguageListByPreferredLanguage(
//             Constants.languageValues.map.keys.toList(),
//             AppData.webTv24x7PreferredLanguage);

//         // ['Gujarati', 'Hindi', 'English'];
//         AppData.currentFirstLangFocusNode = AppData.firstWebTvLangFocusNode;
//         bgImgFileName = 'tv_background.jpg';
//         break;
//       case TabIndex.LIVE_OR_SPECIAL:
//         if (AppData.liveInfo != null &&
//             AppData.liveInfo.liveSatsangVideoList != null &&
//             AppData.liveInfo.liveSatsangVideoList.isNotEmpty) {
//           currentTabLanguageList = AppData.liveInfo.liveSatsangVideoList
//               .map((e) => e.languageName)
//               .toList();
//         } else {
//           /// Remove this dummy data
//           // currentTabLanguageList =
//           //     Constants.liveLanguageValues.map.keys.toList();

//           currentTabLanguageList = [];

//           // currentTabLanguageList = [
//           //   'Gujarati',
//           //   'Hindi',
//           //   'English',
//           //   'German',
//           //   'Spanish',
//           //   'Portuguese'
//           // ];
//         }
//         currentTabLanguageList = Languages.sortLanguageListByPreferredLanguage(
//             currentTabLanguageList, AppData.livePreferredLanguage);

//         AppData.currentFirstLangFocusNode = AppData.firstLiveLangFocusNode;

//         if (AppData.liveInfo.isSpecial) {
//           bgImgFileName = 'special_background.jpg';
//         } else {
//           bgImgFileName = 'live_background.jpg';
//         }

//         break;
//     }
//     return _buildTabContentPage();
//   }
// }
