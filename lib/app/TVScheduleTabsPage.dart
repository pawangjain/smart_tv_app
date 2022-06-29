// import 'package:dadabhagwan_tv/app/TVSchedule.dart';
// import 'package:dadabhagwan_tv/common/constants.dart';
// import 'package:flutter/material.dart';

// class TVScheduleTabsPage extends StatefulWidget {
//   @override
//   _TVScheduleTabsPageState createState() => _TVScheduleTabsPageState();
// }

// class _TVScheduleTabsPageState extends State<TVScheduleTabsPage>
//     with SingleTickerProviderStateMixin {
//   TabController _controller;
//   int _selectedTabIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     _controller = TabController(length: 3, vsync: this);
//   }

//   onChangeFocus(int tabIndex) {
//     print("FOCUS ON $tabIndex");
//     _controller.animateTo(tabIndex);
//     setState(() {
//       _selectedTabIndex = tabIndex;
//     });
//   }

//   Widget createTab(String name, int index) {
//     BorderRadius _borderRadius = BorderRadius.only(
//       topLeft: Radius.circular(10),
//       topRight: Radius.circular(10),
//     );
//     return InkWell(
//       // borderRadius: _borderRadius,
      
//       onFocusChange: (value) {
//         if (value) {
//           onChangeFocus(index);
//         }
//       },
//       onTap: () {
//         onChangeFocus(index);
//       },
//       child: Align(
//         child: Tab(
//           text: name,
//           // key: UniqueKey(),
//         ),
//         alignment: Alignment.center,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 30),
//       decoration: BoxDecoration(
//         color: Colors.black,
//         borderRadius: BorderRadius.only(topRight: Radius.circular(10)),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         appBar: PreferredSize(
//           preferredSize: Size.fromHeight(60),
//           child: Padding(
//             padding: const EdgeInsets.only(bottom: 0),
//             child: Padding(
//               padding: const EdgeInsets.only(bottom: 3),
//               child: Container(
//                 child: TabBar(
//                   controller: _controller,

//                   indicator: BoxDecoration(
//                     border: Border(
//                       bottom: BorderSide(
//                         color: Constants.highlightColor,
//                         width: 3.0,
//                       ),
//                     ),
//                   ),
//                   indicatorSize: TabBarIndicatorSize.tab,
//                   // unselectedLabelColor: Colors.blue,
//                   labelStyle: TextStyle(fontSize: 22.0),
//                   unselectedLabelStyle: TextStyle(fontSize: 22.0),
//                   tabs: [
//                     // Align(
//                     //   child: Tab(text: "ગુજરાતી"),
//                     //   alignment: Alignment.center,
//                     // ),
//                     // Align(
//                     //   child: Tab(text: "हिंदी"),
//                     //   alignment: Alignment.center,
//                     // ),
//                     // Align(
//                     //   child: Tab(text: "English"),
//                     //   alignment: Alignment.center,
//                     // ),
//                     createTab("ગુજરાતી", 0),
//                     createTab("हिंदी", 1),
//                     createTab("English", 2),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//         body: TabBarView(
//           controller: _controller,
//           children: [
//             TVSchedulePage(language: Language.GUJARATI),
//             TVSchedulePage(language: Language.HINDI),
//             TVSchedulePage(language: Language.ENGLISH),
//           ],
//         ),
//       ),
//     );
//   }
// }
