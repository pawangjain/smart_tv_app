// import 'package:dadabhagwan_tv/api/apiservice.dart';
// import 'package:dadabhagwan_tv/common/constants.dart';
// import 'package:dadabhagwan_tv/localVariables.dart';
// import 'package:dadabhagwan_tv/models/LiveScheduleModel.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:dadabhagwan_tv/common/utils.dart';

// class LiveSchedulePage extends StatefulWidget {
//   @override
//   _LiveSchedulePageState createState() => _LiveSchedulePageState();
// }

// class _LiveSchedulePageState extends State<LiveSchedulePage> {
//   bool isLoading;
//   String error;
//   // LiveAPIService apiService = LiveAPIService();

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

//   String reFormatDate(String date) {
//     return DateFormat('dd MMM yyyy').format(
//       DateFormat('dd/MM/yy').parse(date),
//     );
//   }

//   void getTvSchedule() async {
//     showLoader();
//     try {
//       if (LocalVariable.liveScedule.length == 0) {
//         // reset variables
//         error = null;
//         // Get schedule from API
//         LocalVariable.liveScedule =
//             (await APIService.getLiveSchedule())?.liveschedule;
//       }
//     } catch (e) {
//       error = Constants.genericErrorMsg;
//     }
//     hideLoader();
//   }

//   Widget dateWidget(Liveschedule item) {
//     return Container(
//       width: MediaQuery.of(context).size.width / 5,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(Icons.calendar_today_sharp, color: Colors.grey),
//           SizedBox(height: 10),
//           Text(
//             item?.esdate == item?.eedate
//                 ? "${reFormatDate(item?.esdate)}"
//                 : "${reFormatDate(item?.esdate)} to ${reFormatDate(item?.eedate)}",
//           )
//         ],
//       ),
//     );
//   }

//   Widget durationWidget(Liveschedule item) {
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
//             item?.estime != null
//                 ? "${item?.estime?.removeSecondsPart()} to ${item?.eetime?.removeSecondsPart()}"
//                 : "TBA",
//           )
//         ],
//       ),
//     );
//   }

//   Widget videoTitleWidget(Liveschedule item) {
//     return Container(
//       width: MediaQuery.of(context).size.width / 4,
//       // child: Text(
//       //   item?.edname,
//       //   style: Theme.of(context).textTheme.subtitle1,
//       //   softWrap: true,
//       //   textAlign: TextAlign.left,
//       // ),
//       child: Html(
//         data: item?.edname,
//       ),
//     );
//   }

//   Widget scheduleRow(Liveschedule item) {
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
//             dateWidget(item),
//             durationWidget(item),
//             videoTitleWidget(item),
//           ],
//         ),
//       ),
//       onTap: () {},
//     );
//   }

//   Widget showSchedule() {
//     return LocalVariable.liveScedule.length > 0
//         ? ListView.builder(
//             itemCount: LocalVariable.liveScedule.length,
//             itemBuilder: (BuildContext context, int index) {
//               Liveschedule item = LocalVariable.liveScedule[index];
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
//     super.initState();
//     getTvSchedule();
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
