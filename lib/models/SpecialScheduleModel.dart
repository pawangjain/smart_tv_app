class SpecialScheduleModel {
  SpecialScheduleModel({
    this.specialsatsanglist,
  });

  List<SpecialSatsang> specialsatsanglist;

  factory SpecialScheduleModel.fromJson(Map<String, dynamic> json) =>
      SpecialScheduleModel(
        specialsatsanglist: List<SpecialSatsang>.from(
            json["specialsatsanglist"].map((x) => SpecialSatsang.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "specialsatsanglist":
            List<dynamic>.from(specialsatsanglist.map((x) => x.toJson())),
      };
}

class SpecialSatsang {
  SpecialSatsang({
    this.videoName,
    this.ftime,
    this.ttime,
    this.isDaily,
    this.platform,
    this.liveEmbedCode,
    this.videoid,
    this.youtubeId,
    this.embedCode,
  });

  String videoName;
  String ftime;
  String ttime;
  bool isDaily;
  String platform;
  String liveEmbedCode;
  int videoid;
  String youtubeId;
  String embedCode;

  factory SpecialSatsang.fromJson(Map<String, dynamic> json) => SpecialSatsang(
        videoName: json["video_name"],
        ftime: json["ftime"],
        ttime: json["ttime"],
        isDaily: json["isDaily"],
        platform: json["Platform"],
        liveEmbedCode: json["LiveEmbedCode"],
        videoid: json["videoid"],
        youtubeId: json["YoutubeId"],
        embedCode: json["EmbedCode"],
      );

  Map<String, dynamic> toJson() => {
        "video_name": videoName,
        "ftime": ftime,
        "ttime": ttime,
        "isDaily": isDaily,
        "Platform": platform,
        "LiveEmbedCode": liveEmbedCode,
        "videoid": videoid,
        "YoutubeId": youtubeId,
        "EmbedCode": embedCode,
      };
}
