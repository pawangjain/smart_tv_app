// import 'package:dadabhagwan_tv/api/apiservice.dart';
// import 'package:dadabhagwan_tv/common/constants.dart';
// import 'package:dadabhagwan_tv/common/utils.dart';
// import 'package:dadabhagwan_tv/localVariables.dart';
// import 'package:dadabhagwan_tv/models/TVScheduleModel.dart';
// import 'package:flutter/material.dart';

// class TVSchedulePage extends StatefulWidget {
//   final Language language;

//   const TVSchedulePage({Key key, @required this.language}) : super(key: key);
//   @override
//   _TVSchedulePageState createState() => _TVSchedulePageState();
// }

// class _TVSchedulePageState extends State<TVSchedulePage> {
//   bool isLoading;
//   String error;
//   // APIService apiService = APIService();
//   // List<WebTVLang> webTVLang = [];

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
//       child: Text(error ?? '', style: Theme.of(context).textTheme.subtitle1),
//     );
//   }

//   void getTvSchedule() async {
//     showLoader();
//     try {
//       if (LocalVariable.tvScedule[widget.language].length == 0) {
//         // webTVLang = await apiService.getWebTvLang();
//         // reset variables
//         error = null;
//         // Get Current date annd time from API
//         // String curdate = await apiService.getIndianTime();
//         // String curdate = DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now());
//         String curdate = Utils.getCurrentDateTime();
//         // Get schedule from API
//         LocalVariable.tvScedule[widget.language] = await APIService.getSchedule(
//           curdate.split(' ').first,
//           widget.language,
//         );
//       }
//     } catch (e) {
//       error = Constants.genericErrorMsg;
//     }
//     hideLoader();
//   }

//   Widget durationWidget(Tvschedule item) {
//     return Container(
//       width: MediaQuery.of(context).size.width / 6,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(Icons.watch_later_outlined, color: Colors.grey),
//           SizedBox(height: 10),
//           Text("${item?.fromtime} to ${item?.totime}")
//         ],
//       ),
//     );
//   }

//   Widget programImageWidget(Tvschedule item) {
//     return Container(
//       // height: 100,
//       decoration: BoxDecoration(
//         border: Border.all(),
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(10.0),
//         child: Image(
//           image: NetworkImage(item?.programImage),
//           width: MediaQuery.of(context).size.width / 6,
//           errorBuilder: (
//             BuildContext context,
//             Object exception,
//             StackTrace stackTrace,
//           ) {
//             return Image(
//               image: AssetImage('images/placeholder.jpg'),
//               width: MediaQuery.of(context).size.width / 6,
//             );
//             // return Container(
//             //   height: 40,
//             //   width: MediaQuery.of(context).size.width / 6,
//             //   color: Colors.grey,
//             //   child: Center(
//             //     child: Icon(
//             //       Icons.image,
//             //     ),
//             //   ),
//             // );
//             // return Container(
//             //   padding: EdgeInsets.only(top: 30, bottom: 30),
//             //   child: Center(
//             //     child: Text('  Error to load Image... 😢!!  '),
//             //   ),
//             // );
//           },
//         ),
//       ),
//     );
//   }

//   Widget videoTitleWidget(Tvschedule item) {
//     return Container(
//       width: MediaQuery.of(context).size.width / 4,
//       child: Text(
//         item?.videoShortName,
//         style: Theme.of(context).textTheme.subtitle1,
//         softWrap: true,
//         textAlign: TextAlign.left,
//       ),
//     );
//   }

//   Widget scheduleRow(Tvschedule item) {
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
//             programImageWidget(item),
//             videoTitleWidget(item),
//           ],
//         ),
//       ),
//       onTap: () {},
//     );
//   }

//   Widget showSchedule() {
//     return LocalVariable.tvScedule[widget.language].length > 0
//         ? ListView.builder(
//             itemCount: LocalVariable.tvScedule[widget.language].length,
//             itemBuilder: (BuildContext context, int index) {
//               Tvschedule item = LocalVariable.tvScedule[widget.language][index];
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
//     getTvSchedule();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: isLoading
//           ? loader()
//           : error != null
//               ? showError()
//               : showSchedule(),
//     );
//   }
// }
