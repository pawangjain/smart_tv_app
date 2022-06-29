// import 'package:dadabhagwan_tv/api/apiservice.dart';
// import 'package:dadabhagwan_tv/common/constants.dart';
// import 'package:dadabhagwan_tv/localVariables.dart';
// import 'package:dadabhagwan_tv/models/SpecialScheduleModel.dart';
// import 'package:flutter/material.dart';
// import '../common/utils.dart';

// class SpecialSchedulePage extends StatefulWidget {
//   @override
//   _SpecialSchedulePageState createState() => _SpecialSchedulePageState();
// }

// class _SpecialSchedulePageState extends State<SpecialSchedulePage> {
//   bool isLoading;
//   String error;
//   // SSAPIservice apiService = SSAPIservice();

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

//   Widget showError() {
//     return Center(
//       child: Text(error, style: Theme.of(context).textTheme.subtitle1),
//     );
//   }

//   void getSchedule() async {
//     showLoader();
//     try {
//       if (LocalVariable.specialSatsangSchedule.length == 0) {
//         // reset variables
//         error = null;
//         // Get schedule from API
//         LocalVariable.specialSatsangSchedule =
//             (await APIService.getSpecialSatsangSchedule())?.specialsatsanglist;
//       }
//     } catch (e) {
//       error = Constants.genericErrorMsg;
//     }
//     hideLoader();
//   }

//   Widget durationWidget(SpecialSatsang item) {
//     return Container(
//       width: MediaQuery.of(context).size.width / 5,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(Icons.watch_later_outlined, color: Colors.grey),
//           SizedBox(height: 10),
//           Text(
//             item?.ftime != null
//                 ? "${item?.ftime?.removeSecondsPart()} to ${item?.ttime?.removeSecondsPart()}"
//                 : "TBA",
//           )
//         ],
//       ),
//     );
//   }

//   Widget videoTitleWidget(SpecialSatsang item) {
//     return Container(
//       width: MediaQuery.of(context).size.width / 3,
//       child: Text(
//         item?.videoName,
//         style: Theme.of(context).textTheme.subtitle1,
//         softWrap: true,
//         textAlign: TextAlign.left,
//       ),
//     );
//   }

//   Widget scheduleRow(SpecialSatsang item) {
//     return InkWell(
//       child: Container(
//         padding: EdgeInsets.symmetric(
//           horizontal: 10,
//           vertical: 15,
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             durationWidget(item),
//             videoTitleWidget(item),
//           ],
//         ),
//       ),
//       onTap: () {},
//     );
//   }

//   Widget showSchedule() {
//     return LocalVariable.specialSatsangSchedule.length > 0
//         ? ListView.builder(
//             itemCount: LocalVariable.specialSatsangSchedule.length,
//             itemBuilder: (BuildContext context, int index) {
//               SpecialSatsang item = LocalVariable.specialSatsangSchedule[index];
//               return Column(
//                 children: [
//                   scheduleRow(item),
//                   Divider(height: 0),
//                 ],
//               );
//             },
//           )
//         : Center(child: Text('No Schedule Available'));
//   }

//   @override
//   void initState() {
//     getSchedule();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(10),
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         body: Container(
//           child: isLoading
//               ? loader()
//               : error != null
//                   ? showError()
//                   : Column(
//                       children: [
//                         Container(
//                           padding: EdgeInsets.all(10),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: Colors.grey.shade900,
//                               borderRadius: BorderRadius.circular(5.0),
//                             ),
//                             child: Container(
//                               // leading: Icon(Icons.info),
//                               // dense: true,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(14.0),
//                                 child: Text(
//                                   Constants.timezoneConversionNote,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: showSchedule(),
//                         ),
//                       ],
//                     ),
//         ),
//       ),
//     );
//   }
// }
