class TvScheduleModel {
  TvScheduleModel({
    this.tvschedule,
  });

  List<Tvschedule> tvschedule;

  factory TvScheduleModel.fromJson(Map<String, dynamic> json) =>
      TvScheduleModel(
        tvschedule: List<Tvschedule>.from(
            json["tvschedule"].map((x) => Tvschedule.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tvschedule": List<dynamic>.from(tvschedule.map((x) => x.toJson())),
      };
}

class Tvschedule {
  Tvschedule({
    this.totime,
    this.fromtime,
    this.videoName,
    this.duration,
    this.videoShortName,
    this.sequence,
    this.scheduleDate,
    this.videoId,
    this.webTvScheduleId,
    this.authorName,
    this.programImage,
    this.videoTypeId,
  });

  String totime;
  String fromtime;
  String videoName;
  String duration;
  String videoShortName;
  int sequence;
  DateTime scheduleDate;
  int videoId;
  int webTvScheduleId;
  AuthorName authorName;
  String programImage;
  int videoTypeId;

  factory Tvschedule.fromJson(Map<String, dynamic> json) => Tvschedule(
        totime: json["TOTIME"],
        fromtime: json["FROMTIME"],
        videoName: json["VIDEO_NAME"],
        duration: json["duration"],
        videoShortName: json["VIDEO_SHORT_NAME"],
        sequence: json["SEQUENCE"],
        scheduleDate: DateTime.parse(json["SCHEDULE_DATE"]),
        videoId: json["VIDEO_ID"],
        webTvScheduleId: json["WEB_TV_SCHEDULE_ID"],
        authorName: authorNameValues.map[json["AUTHOR_NAME"]],
        programImage: json["Program_Image"],
        videoTypeId: json["VIDEO_TYPE_ID"],
      );

  Map<String, dynamic> toJson() => {
        "TOTIME": totime,
        "FROMTIME": fromtime,
        "VIDEO_NAME": videoName,
        "duration": duration,
        "VIDEO_SHORT_NAME": videoShortName,
        "SEQUENCE": sequence,
        "SCHEDULE_DATE": scheduleDate.toIso8601String(),
        "VIDEO_ID": videoId,
        "WEB_TV_SCHEDULE_ID": webTvScheduleId,
        "AUTHOR_NAME": authorNameValues.reverse[authorName],
        "Program_Image": programImage,
        "VIDEO_TYPE_ID": videoTypeId,
      };
}

enum AuthorName { PUJYA_DEEPAKBHAI, PUJYA_DADASHRI, UNKNOWN, PUJYA_NIRUMA }

final authorNameValues = EnumValues({
  "Pujya Dadashri": AuthorName.PUJYA_DADASHRI,
  "Pujya Deepakbhai": AuthorName.PUJYA_DEEPAKBHAI,
  "Pujya Niruma": AuthorName.PUJYA_NIRUMA,
  "Unknown": AuthorName.UNKNOWN
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => MapEntry(v, k));
    }
    return reverseMap;
  }
}
