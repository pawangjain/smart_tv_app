// import 'package:dadabhagwan_tv/app/LiveSchedule.dart';
// import 'package:dadabhagwan_tv/app/SpecialSchedule.dart';
// import 'package:dadabhagwan_tv/app/TVScheduleTabsPage.dart';
// import 'package:dadabhagwan_tv/common/constants.dart';
// import 'package:dadabhagwan_tv/localVariables.dart';
// import 'package:flutter/material.dart';

// class ScheduleMainPage extends StatefulWidget {
//   @override
//   _ScheduleMainPageState createState() => _ScheduleMainPageState();
// }

// class _ScheduleMainPageState extends State<ScheduleMainPage>
//     with SingleTickerProviderStateMixin {
//   List<Widget> tabView = [
//     TVScheduleTabsPage(),
//     LiveSchedulePage(),
//     SpecialSchedulePage()
//   ];

//   TabController _controller;
//   int _selectedTabIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     _controller = TabController(length: tabView.length, vsync: this);
//     _controller.addListener(_onTabChange);
//   }

//   void _onTabChange() {
//     if (_controller.indexIsChanging) {
//       print(
//           "tab is animating. from active (getting the index) to inactive(getting the index) ");
//     } else {
//       _selectedTabIndex = _controller.index;
//       print('## Current Tab = ' + _selectedTabIndex.toString());
//       setState(() {});
//     }
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
//       borderRadius: _borderRadius,
//       onFocusChange: (value) {
//         if (value) {
//           onChangeFocus(index);
//         }
//       },
//       onTap: () {
//         onChangeFocus(index);
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: _selectedTabIndex == index ? Colors.black : null,
//           borderRadius: _borderRadius,
//         ),
//         padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
//         child: Text(
//           name,
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget newSchedulePage() {
//     double tabPadding = 24;
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         // backgroundColor: Colors.black,
//         appBar: PreferredSize(
//             preferredSize: Size.fromHeight(60),
//             child: Row(
//               children: [
//                 createTab("TV", 0),
//                 createTab("LIVE", 1),
//                 createTab("SPECIAL", 2),
//               ],
//             )),
//         body: SafeArea(
//           child: Container(
//             color: Colors.black,
//             child: Padding(
//               padding: EdgeInsets.fromLTRB(tabPadding, 5, tabPadding, 5),
//               child: TabBarView(
//                 controller: _controller,
//                 children: tabView,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     LocalVariable.liveScedule = [];
//     LocalVariable.tvScedule = {
//       Language.GUJARATI: [],
//       Language.HINDI: [],
//       Language.ENGLISH: [],
//     };
//     LocalVariable.specialSatsangSchedule = [];
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(15),
//           child: ClipRRect(
//             borderRadius: BorderRadius.all(
//               Radius.circular(10),
//             ),
//             child: newSchedulePage(),
//           ),
//         ),
//       ),
//     );
//   }
// }
