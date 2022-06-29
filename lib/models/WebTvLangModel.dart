// class WebTvLangModel {
//   WebTvLangModel({
//     this.webtvlang,
//   });

//   List<WebTVLang> webtvlang;

//   factory WebTvLangModel.fromJson(Map<String, dynamic> json) => WebTvLangModel(
//         webtvlang: List<WebTVLang>.from(
//             json["webtvlang"].map((x) => WebTVLang.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "webtvlang": List<dynamic>.from(webtvlang.map((x) => x.toJson())),
//       };
// }

// class WebTVLang {
//   WebTVLang({
//     this.channelId,
//     this.channelName,
//   });

//   int channelId;
//   Language channelName;

//   factory WebTVLang.fromJson(Map<String, dynamic> json) => WebTVLang(
//         channelId: json["CHANNEL_ID"],
//         channelName: languageValues.map[json["CHANNEL_NAME"]],
//       );

//   Map<String, dynamic> toJson() => {
//         "CHANNEL_ID": channelId,
//         "CHANNEL_NAME": languageValues.reverse[channelName],
//       };
// }

// enum Language { GUJARATI, HINDI, ENGLISH }

// final languageValues = EnumValues({
//   "Gujarati": Language.GUJARATI,
//   "Hindi": Language.HINDI,
//   "English": Language.ENGLISH,
// });

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
