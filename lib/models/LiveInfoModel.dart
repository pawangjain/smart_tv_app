class LiveInfoModel {
  LiveInfoModel({
    this.isLive = false,
    this.isSpecial = false,
    this.defaultTimezone,
    this.liveSatsangSchedule,
    this.liveSatsangVideoList,
    this.dbfYoutubeChannelUrl,
  });

  bool isLive;
  bool isSpecial;
  String defaultTimezone;
  List<dynamic> liveSatsangSchedule;
  List<LiveSatsangVideo> liveSatsangVideoList;
  String dbfYoutubeChannelUrl;

  // LiveInfoModel copyWith({
  //   bool isLive,
  //   String defaultTimezone,
  //   List<dynamic> liveSatsangSchedule,
  //   List<LiveSatsangVideoList> liveSatsangVideoList,
  //   String dbfYoutubeChannelUrl,
  // }) =>
  //     LiveInfoModel(
  //       isLive: isLive ?? this.isLive,
  //       defaultTimezone: defaultTimezone ?? this.defaultTimezone,
  //       liveSatsangSchedule: liveSatsangSchedule ?? this.liveSatsangSchedule,
  //       liveSatsangVideoList: liveSatsangVideoList ?? this.liveSatsangVideoList,
  //       dbfYoutubeChannelUrl: dbfYoutubeChannelUrl ?? this.dbfYoutubeChannelUrl,
  //     );

  factory LiveInfoModel.fromJson(Map<String, dynamic> json) => LiveInfoModel(
        isLive: json['is_live'] == 'Y',
        isSpecial: json['is_special'] == 'Y',
        defaultTimezone: json['default_timezone'],
        liveSatsangSchedule:
            List<dynamic>.from(json['live_satsang_schedule'].map((x) => x)),
        liveSatsangVideoList: List<LiveSatsangVideo>.from(
            json['live_satsang_video_list']
                .map((x) => LiveSatsangVideo.fromJson(x))),
        dbfYoutubeChannelUrl: json['dbf_youtube_channel_url'],
      );

  Map<String, dynamic> toJson() => {
        'is_live': isLive,
        'default_timezone': defaultTimezone,
        'live_satsang_schedule':
            List<dynamic>.from(liveSatsangSchedule.map((x) => x)),
        'live_satsang_video_list':
            List<dynamic>.from(liveSatsangVideoList.map((x) => x.toJson())),
        'dbf_youtube_channel_url': dbfYoutubeChannelUrl,
      };
}

class LiveSatsangVideo {
  LiveSatsangVideo({
    this.languageName,
    this.youtubeVideoId,
    this.languageId,
    this.embedCode,
    this.videoUrl,
    this.languageOrder,
    this.isAutoPlay,
    this.isRedirectToYouTube,
    this.translation,
    this.eventTitle,
    this.eventDate,
    this.startTime,
    this.endTime,
  });

  String languageName;
  String youtubeVideoId;
  int languageId;
  String embedCode;
  String videoUrl;
  int languageOrder;
  bool isAutoPlay;
  bool isRedirectToYouTube;
  bool translation;
  String eventTitle;
  String eventDate;
  String startTime;
  String endTime;

  LiveSatsangVideo copyWith({
    String languageName,
    String youtubeVideoId,
    int languageId,
    String embedCode,
    String videoUrl,
    int languageOrder,
    bool isAutoPlay,
    bool isRedirectToYouTube,
    bool translation,
    String eventTitle,
    String eventDate,
    String startTime,
    String endTime,
  }) =>
      LiveSatsangVideo(
        languageName: languageName ?? this.languageName,
        youtubeVideoId: youtubeVideoId ?? this.youtubeVideoId,
        languageId: languageId ?? this.languageId,
        embedCode: embedCode ?? this.embedCode,
        videoUrl: videoUrl ?? this.videoUrl,
        languageOrder: languageOrder ?? this.languageOrder,
        isAutoPlay: isAutoPlay ?? this.isAutoPlay,
        isRedirectToYouTube: isRedirectToYouTube ?? this.isRedirectToYouTube,
        translation: translation ?? this.translation,
        eventTitle: eventTitle ?? this.eventTitle,
        eventDate: eventDate ?? this.eventDate,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
      );

  factory LiveSatsangVideo.fromJson(Map<String, dynamic> json) =>
      LiveSatsangVideo(
        languageName: json['languageName'],
        youtubeVideoId: json['youtubeVideoId'],
        languageId: json['languageId'],
        embedCode: json['embedCode'],
        videoUrl: json['videoUrl'],
        languageOrder: json['languageOrder'],
        isAutoPlay: json['isAutoPlay'],
        isRedirectToYouTube: json['isRedirectToYouTube'],
        translation: json['translation'],
        eventTitle: json['eventTitle'],
        eventDate: json['eventDate'],
        startTime: json['startTime'],
        endTime: json['endTime'],
      );

  Map<String, dynamic> toJson() => {
        'languageName': languageName,
        'youtubeVideoId': youtubeVideoId,
        'languageId': languageId,
        'embedCode': embedCode,
        'videoUrl': videoUrl,
        'languageOrder': languageOrder,
        'isAutoPlay': isAutoPlay,
        'isRedirectToYouTube': isRedirectToYouTube,
        'translation': translation,
        'eventTitle': eventTitle,
        'eventDate': eventDate,
        'startTime': startTime,
        'endTime': endTime,
      };
}
