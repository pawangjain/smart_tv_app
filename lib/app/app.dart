// import 'package:dadabhagwan_tv/api/apiservice.dart';
// import 'package:dadabhagwan_tv/app/LiveTVtab.dart';
// import 'package:dadabhagwan_tv/app/schedule_main.dart';
// import 'package:dadabhagwan_tv/app/settings_page.dart';
// import 'package:dadabhagwan_tv/common/circular_material_button.dart';
// import 'package:dadabhagwan_tv/common/constants.dart';
// import 'package:dadabhagwan_tv/common/utils.dart';
// import 'package:dadabhagwan_tv/models/LiveInfoModel.dart';
// import 'package:dadabhagwan_tv/common/app_data.dart';
// import 'package:dadabhagwan_tv/models/app_change_notifier_provider.dart';
// import 'package:dadabhagwan_tv/models/init_app_response.dart';
// import 'package:dadabhagwan_tv/services/shared_preferences_service.dart';
// import 'package:version/version.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_native_timezone/flutter_native_timezone.dart';
// import 'package:provider/provider.dart';

// class App extends StatefulWidget {
//   @override
//   _AppState createState() => _AppState();
// }

// class _AppState extends State<App> with WidgetsBindingObserver {
//   AppChangeNotifierProvider appChangeNotifierProvider;

//   String liveSpecialTabName = Constants.liveTabName;
//   String liveSpecialTabInfo = Constants.liveTabInfo;

//   @override
//   void initState() {
//     super.initState();
//     appChangeNotifierProvider =
//         Provider.of<AppChangeNotifierProvider>(context, listen: false);

//     Future.delayed(Duration.zero, _fetchLiveInfo);

//     /// Donot invoke it here, since it clashes with the loading modal and hangs the app
//     // Future.delayed(Duration(milliseconds: 100), _checkIfAppUpdateIsAvailable);
//   }

//   @override
//   void dispose() {
//     // Clean up the focus node when the Form is disposed.
//     AppData.firstWebTvLangFocusNode.dispose();
//     AppData.firstLiveLangFocusNode.dispose();

//     super.dispose();
//   }

//   _fetchLiveInfo() async {
//     try {
//       // String timezoneName = await FlutterNativeTimezone.getLocalTimezone();
//       var response = await APIService.sendHttpRequest(
//           Uri.https(
//             '${Constants.AKFAST_URL}',
//             '/api/fetch_live_info_for_tv/',
//           ),
//           {
//             // 'user_tz': timezoneName,
//             // /// reqrd only for live schedule
//             // 'is_schedule_required': false,
//           },
//           context);

//       if (response != null && response['success']) {
//         if (response['data'] != null) {
//           AppData.liveInfo = LiveInfoModel.fromJson(response['data']);

//           if (AppData.liveInfo.isLive) {
//             AppData.currentTabIndex = TabIndex.LIVE_OR_SPECIAL;
//             AppData.currentFirstLangFocusNode = AppData.firstLiveLangFocusNode;
//           } else {
//             AppData.currentTabIndex = TabIndex.TV;
//             AppData.currentFirstLangFocusNode = AppData.firstWebTvLangFocusNode;
//           }

//           if (AppData.liveInfo.isSpecial) {
//             liveSpecialTabName = Constants.specialVideoTabName;
//             liveSpecialTabInfo = Constants.specialVideoTabInfo;
//           } else {
//             liveSpecialTabName = Constants.liveTabName;
//             liveSpecialTabInfo = Constants.liveTabInfo;
//           }
//           appChangeNotifierProvider.blankNotify();

//           _setFocusOnFirstLangTab();
//         }
//       }
//     } catch (e) {
//       print('#EXC _fetchLiveInfo:: $e');
//     }

//     Future.delayed(Duration(milliseconds: 500), _checkIfAppUpdateIsAvailable);
//   }

//   _checkIfAppUpdateIsAvailable() async {
//     try {
//       var response = await APIService.sendHttpRequest(
//         Uri.https(
//           '${Constants.AKFAST_URL}',
//           '/api/init_android_tv_app/',
//         ),
//         {},
//         null,
//         showLoading: false,
//         showErrorMsg: false,
//       );

//       if (response != null) {
//         InitAppResponse initAppResponse = InitAppResponse.fromJson(
//           response,
//         );

//         Version installedVersion =
//             Version.parse(AppData.currPhysicalDevice.appVersion);
//         Version serverVersion =
//             Version.parse(initAppResponse.latestAndroidAppVersion);

//         if (serverVersion > installedVersion) {
//           debugPrint("Update is available");
//           String sharedPrefReminderDateStr =
//               await SharedPreferencesService.getString(
//                   SharedPrefConstants.AppUpdateReminderDate);
//           DateTime todaysDate = DateTime.now();
//           DateTime sharedPrefReminderDate;

//           if (Utils.isNullOrEmpty(sharedPrefReminderDateStr)) {
//             sharedPrefReminderDate = todaysDate;
//             await SharedPreferencesService.setString(
//                 SharedPrefConstants.AppUpdateReminderDate,
//                 todaysDate.toString());
//           } else {
//             sharedPrefReminderDate = DateTime.parse(sharedPrefReminderDateStr);
//           }

//           bool isReminderDateCrossed =
//               sharedPrefReminderDate.difference(todaysDate).inDays <= 0;

//           bool showRemindLaterBtn = true;

//           if (!Utils.isNullOrEmpty(
//               initAppResponse.minimumRequiredAndroidAppVersion)) {
//             Version serverMinimumRequiredVersion =
//                 Version.parse(initAppResponse.minimumRequiredAndroidAppVersion);

//             if (installedVersion < serverMinimumRequiredVersion) {
//               isReminderDateCrossed = true;
//               showRemindLaterBtn = false;
//             }
//           }

//           String appstoreUrl = Constants.appPlayStoreUrl;

//           appstoreUrl =
//               response[AppData.currPhysicalDevice.deviceOs + '_store_url'];

//           if (Utils.isNullOrEmpty(appstoreUrl)) {
//             appstoreUrl = Constants.appPlayStoreUrl;
//           }

//           if (isReminderDateCrossed) {
//             Utils.showAlert(
//                 context: context,
//                 closeable: false,
//                 title: 'Update is available',
//                 msg:
//                     '\nNew version (${initAppResponse.latestAndroidAppVersion}) is available with enhanced features.\n\nPlease click on "Update Now" button to update it from the app store.\n\n',
//                 doneButtonText: 'Update Now',
//                 doneButtonFn: () {
//                   Utils.launchURL(appstoreUrl);
//                 },
//                 showCancelButton: showRemindLaterBtn,
//                 cancelButtonText: 'Remind Later',
//                 doneCancelFn: () {
//                   _onRemindMeLaterPressed();
//                 });
//           }
//         }
//       }
//     } catch (e) {
//       print('#EXC _checkIfAppUpdateIsAvailable - $e');
//     }
//   }

//   _onRemindMeLaterPressed() async {
//     DateTime todaysDate = DateTime.now()
//         .add(Duration(days: Constants.APP_UPDATE_REMINDER_INTERVAL_DAYS));

//     await SharedPreferencesService.setString(
//         SharedPrefConstants.AppUpdateReminderDate, todaysDate.toString());

//     Navigator.pop(context);
//   }

//   Widget _scheduleButton() {
//     return CircularMaterialButton(
//       iconImgPath: 'images/schedule.png',
//       onPressed: () {
//         APIService.sendStats('SCHEDULE_BTN_CLICK', {});

//         Navigator.of(context).push(PageOverlay());

//         // Navigator.of(context).push(
//         //   MaterialPageRoute<Null>(
//         //     builder: (BuildContext context) {
//         //       return ScheduleMainPage();
//         //     },
//         //     fullscreenDialog: true,
//         //   ),
//         // );
//       },
//     );
//   }

//   Widget _settingsButton() {
//     return CircularMaterialButton(
//       iconImgPath: 'images/settings.png',
//       onPressed: () async {
//         APIService.sendStats('SETTINGS_BTN_CLICK', {});

//         await Navigator.of(context).push(
//           MaterialPageRoute<Null>(
//             builder: (BuildContext context) {
//               return SettingsPage();
//             },
//             fullscreenDialog: true,
//           ),
//         );
//         appChangeNotifierProvider.blankNotify();
//         _setFocusOnFirstLangTab();
//       },
//     );
//   }

//   Widget _refreshButton() {
//     return CircularMaterialButton(
//       iconWidget: Icon(
//         Icons.refresh,
//         size: 28,
//         color: Color(0xFF666763),
//       ),
//       onPressed: () {
//         APIService.sendStats('REFRESH_BTN_CLICK', {});
//         _fetchLiveInfo();
//       },
//     );
//   }

//   Widget _buildTopBar() {
//     return Container(
//       // color: Colors.black12,
//       padding: EdgeInsets.only(
//         top: 20,
//         bottom: 20,
//         right: 50,
//         left: 20,
//       ),
//       child: Align(
//         alignment: Alignment.topRight,
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // languageDropdown(),
//             // Padding(padding: EdgeInsets.only(right: 10)),
//             _scheduleButton(),
//             _settingsButton(),
//             _refreshButton(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget tabDesing(String title, String label, int index) {
//     Color tabTextColor =
//         AppData.currentTabIndex == index ? Colors.white : Colors.grey;

//     return ClipPath(
//       clipper: AppData.currentTabIndex == index
//           ? CustomTriangleClipper()
//           : CustomStraightLineClipper(),
//       child: Container(
//         child: Stack(
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width / 2,
//               decoration: BoxDecoration(
//                 color: Colors.amberAccent,
//                 // border: Border.all(
//                 //   color: AppData.currentTabIndex == index
//                 //       ? Colors.white
//                 //       : Colors.transparent,
//                 //   width: AppData.currentTabIndex == index ? 3 : 0,
//                 // ),
//               ),
//               child: Material(
//                 color: AppData.currentTabIndex == index
//                     // ? Colors.cyan.shade900
//                     ? (AppData.currentFocusedTabIndex == index)
//                         ? Color(0xFF828383)
//                         : Color(0xFF46483A)
//                     : Colors.black,
//                 child: InkWell(
//                   // focusColor: Constants.highlightColor,
//                   // autofocus: true,
//                   onFocusChange: (isFocus) {
//                     if (isFocus) {
//                       AppData.currentFocusedTabIndex = index;

//                       if (AppData.currentTabIndex != index) {
//                         setState(() {
//                           AppData.currentTabIndex = index;
//                         });
//                         _setFocusOnFirstLangTab();
//                       }
//                     }
//                   },
//                   onTap: () {
//                     if (AppData.currentTabIndex != index) {
//                       setState(() {
//                         AppData.currentTabIndex = index;
//                       });
//                       _setFocusOnFirstLangTab();
//                     }
//                   },
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 20),
//                         child: Center(
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               // (index == TabIndex.LIVE_OR_SPECIAL &&
//                               //         AppData.liveInfo.isLive)
//                               //     ? Container(
//                               //         transform: Matrix4.translationValues(-7, 0, 0),
//                               //         alignment: Alignment.center,
//                               //         height: dotSize,
//                               //         width: dotSize,
//                               //         padding: EdgeInsets.only(right: 10),
//                               //         decoration: BoxDecoration(
//                               //           color: Colors.redAccent[700],
//                               //           borderRadius: BorderRadius.circular(12),
//                               //         ),
//                               //       )
//                               //     : SizedBox(),
//                               Text(
//                                 title,
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .headline5
//                                     .copyWith(
//                                       color: tabTextColor,
//                                     ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Text(
//                         label,
//                         style: Theme.of(context).textTheme.caption.copyWith(
//                               color: tabTextColor,
//                             ),
//                         textAlign: TextAlign.center,
//                         overflow: TextOverflow.clip,
//                         maxLines: 2,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             AppData.currentTabIndex == index
//                 // ? Colors.cyan.shade900
//                 ? Container(
//                     height: 80,
//                     width: MediaQuery.of(context).size.width / 2,
//                     child: CustomPaint(
//                       painter: SelectedTabBorderPainter(),
//                     ),
//                   )
//                 : SizedBox(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _bottomTabs() {
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: Container(
//         height: 80,
//         color: Colors.transparent,
//         width: double.infinity,
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             tabDesing(
//               'TV',
//               '( WATCH PUJYA NIRUMA & PUJYA DEEPAKBHAI 24X7 )',
//               0,
//             ),
//             tabDesing(
//               liveSpecialTabName,
//               liveSpecialTabInfo,
//               1,
//             ),
//             // tabDesing(
//             //   'SPECIAL',
//             //   '( WATCH SPECIAL PROGRAMS )',
//             //   2,
//             // ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<AppChangeNotifierProvider>(
//       builder: (context, cart, child) {
//         return Scaffold(
//           body: SafeArea(
//             child: Stack(
//               children: [
//                 LiveTVTabPage(),
//                 _buildTopBar(),
//                 _bottomTabs(),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void _setFocusOnFirstLangTab() {
//     AppData.currentFocusedTabIndex = -1;
//     Future.delayed(const Duration(milliseconds: 100), () {
//       AppData.currentFirstLangFocusNode?.requestFocus();
//     });
//   }
// }

// class CustomTriangleClipper extends CustomClipper<Path> {
//   double radius = 0, tw = 50, th = 20;

//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.lineTo(0, size.height);
//     path.lineTo(size.width, size.height);
//     path.lineTo(size.width, th + radius);
//     path.arcToPoint(
//       Offset((size.width - tw) - radius, th),
//       radius: Radius.circular(radius),
//       clockwise: false,
//     );
//     path.lineTo(((size.width - tw) / 2) + tw, th);
//     path.lineTo(
//       ((size.width - tw) / 2) + (tw / 2),
//       0,
//     ); //in these lines, the 10 is to have a space of 10 between the top-left corner curve and the triangle
//     path.lineTo((size.width / 2) - (tw / 2), th);
//     path.lineTo(radius, th);
//     path.arcToPoint(
//       Offset(0, th + radius),
//       radius: Radius.circular(radius),
//       clockwise: false,
//     );
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }

// class PageOverlay extends ModalRoute<void> {
//   @override
//   Duration get transitionDuration => Duration(milliseconds: 500);

//   @override
//   bool get opaque => false;

//   @override
//   bool get barrierDismissible => false;

//   @override
//   Color get barrierColor => Colors.black.withOpacity(0.5);

//   @override
//   String get barrierLabel => null;

//   @override
//   bool get maintainState => true;

//   @override
//   Widget buildPage(
//     BuildContext context,
//     Animation<double> animation,
//     Animation<double> secondaryAnimation,
//   ) {
//     // This makes sure that text and other content follows the material style
//     return Material(
//       type: MaterialType.button,
//       shadowColor: Colors.black,
//       color: Colors.black54,
//       // make sure that the overlay content is not cut off
//       child: SafeArea(
//         child: _buildOverlayContent(context),
//       ),
//     );
//   }

//   Widget _buildOverlayContent(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(50),
//       decoration: BoxDecoration(border: Border()),
//       child: ClipRRect(
//         borderRadius: BorderRadius.all(Radius.circular(10)),
//         child: Center(
//           child: ScheduleMainPage(),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget buildTransitions(BuildContext context, Animation<double> animation,
//       Animation<double> secondaryAnimation, Widget child) {
//     // You can add your own animations for the overlay content
//     return FadeTransition(
//       opacity: animation,
//       child: ScaleTransition(
//         scale: animation,
//         child: child,
//       ),
//     );
//   }
// }

// class CustomCutHeight extends CustomClipper<Path> {
//   double radius = 0, tw = 0, th = 20;

//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.lineTo(0, size.height);
//     path.lineTo(size.width, size.height);
//     path.lineTo(size.width, th + radius);
//     path.arcToPoint(
//       Offset((size.width - tw) - radius, th),
//       radius: Radius.circular(radius),
//       clockwise: false,
//     );
//     path.lineTo(((size.width - tw) / 2) + tw, th);
//     path.lineTo(
//       ((size.width - tw) / 2) + (tw / 2),
//       0,
//     ); //in these lines, the 10 is to have a space of 10 between the top-left corner curve and the triangle
//     path.lineTo((size.width / 2) - (tw / 2), th);
//     path.lineTo(radius, th);
//     path.arcToPoint(
//       Offset(0, th + radius),
//       radius: Radius.circular(radius),
//       clockwise: false,
//     );
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }

// class CustomStraightLineClipper extends CustomClipper<Path> {
//   double radius = 0, tw = 0, th = 20;

//   @override
//   Path getClip(Size size) {
//     print("HEIGHT ${size.height} WIDTH ${size.width}");
//     final path = Path();
//     path.lineTo(0, size.height);
//     path.lineTo(size.width, size.height);
//     path.lineTo(size.width, th);
//     path.lineTo(0, th);

//     // path.lineTo(0, size.height);
//     // path.lineTo(size.width, size.height);
//     // path.lineTo(size.width, th + radius);
//     // path.arcToPoint(
//     //   Offset((size.width - tw) - radius, th),
//     //   radius: Radius.circular(radius),
//     //   clockwise: false,
//     // );
//     // path.lineTo(((size.width - tw) / 2) + tw, th);
//     // path.lineTo(
//     //   ((size.width - tw) / 2) + (tw / 2),
//     //   0,
//     // ); //in these lines, the 10 is to have a space of 10 between the top-left corner curve and the triangle
//     // path.lineTo((size.width / 2) - (tw / 2), th);
//     // path.lineTo(radius, th);
//     // path.arcToPoint(
//     //   Offset(0, th + radius),
//     //   radius: Radius.circular(radius),
//     //   clockwise: false,
//     // );
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }

// class SelectedTabBorderPainter extends CustomPainter {
//   double radius = 0, tw = 50, th = 20;

//   @override
//   void paint(Canvas canvas, Size size) {
//     print("#HEIGHT ${size.height} #WIDTH ${size.width}");

//     Paint paint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 5.0;

//     // final path = Path();
//     Path path = Path();
//     // Adds a rectangle
//     // path.addRect(Rect.fromLTWH(
//     //     size.width / 2, size.height / 2, size.width / 4, size.height / 4));

//     path.lineTo(0, size.height);
//     path.lineTo(size.width, size.height);
//     path.lineTo(size.width, th + radius);
//     path.arcToPoint(
//       Offset((size.width - tw) - radius, th),
//       radius: Radius.circular(radius),
//       clockwise: false,
//     );
//     path.lineTo(((size.width - tw) / 2) + tw, th);
//     path.lineTo(
//       ((size.width - tw) / 2) + (tw / 2),
//       0,
//     ); //in these lines, the 10 is to have a space of 10 between the top-left corner curve and the triangle
//     path.lineTo((size.width / 2) - (tw / 2), th);
//     path.lineTo(radius, th);
//     path.arcToPoint(
//       Offset(0, th + radius),
//       radius: Radius.circular(radius),
//       clockwise: false,
//     );

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }
