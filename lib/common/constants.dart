import 'package:flutter/material.dart';

class Constants {
  // ignore: non_constant_identifier_names
  static final bool IS_PRODUCTION_BUILD = true; //false; //true

  static initializeApiUrls() {
    if (IS_PRODUCTION_BUILD) {
     
    }
  }

  static const String supportEmailId = 'webmaster@dadabhagwan.org';
  static const String appPlayStoreUrl = 'https://play.google.com/store/apps/details?id=org.dadabhagwan.dadabhagwantv';

  static String YOUTUBE_TV_APP_PACKAGE_ID = 'com.google.android.youtube.tv';
  static String YOUTUBE_APP_PACKAGE_ID = 'com.google.android.youtube';
  static String FIRE_OS = 'fire_os';

  static final int HTTP_TIMEOUT = 20; // 12 // in seconds

  static const String testYoutubeVideoUrl =
      'https://www.youtube.com/embed/x14nWLcbYIw?start=24&autoplay=1';
  // 'https://www.youtube.com/watch?v=x14nWLcbYIw?autoplay=1&t=24';
  static const String testVimeoVideoUrl =
      'https://player.vimeo.com/video/177196067?autoplay=1&#t=24';
  static const String testSpecialVideoUrl =
      'https://www.dadabhagwan.tv/specialsatsang/gujarati/';

  static const String liveTabName = 'LIVE';
  static const String liveTabInfo = '( WATCH PUJYA DEEPAKBHAI & EVENTS )';
  static const String specialVideoTabName = 'SPECIAL VIDEO';
  static const String specialVideoTabInfo = '( WATCH SPECIAL SATSANG VIDEO )';

  static final int APP_UPDATE_REMINDER_INTERVAL_DAYS = 3;

  static const String genericErrorMsg = 'Unable to connect...';

  static const String timezoneConversionNote =
      'Note: The time shown here is Indian Standard Time (IST). Please adjust your timings accordingly.';

  static const Map<int, String> tabIndexNameMap = {
    TabIndex.TV: 'TV',
    TabIndex.LIVE_OR_SPECIAL: 'LIVE',
    // TabIndex.SPECIAL: 'SPECIAL',
  };

  static const Map<String, int> channelLanguageNameIdMap = {
    'Gujarati': 58,
    'Hindi': 59,
    'English': 60,
  };

  static final languageValues = EnumValues({
    'Gujarati': Language.GUJARATI,
    'Hindi': Language.HINDI,
    'English': Language.ENGLISH,
  });

  static final liveLanguageValues = EnumValues({
    'Gujarati': Language.GUJARATI,
    'Hindi': Language.HINDI,
    'English': Language.ENGLISH,
    'German': Language.GERMAN,
    'Spanish': Language.SPANISH,
    'Portuguese': Language.PORTUGUESE,
  });

  static const Map<String, dynamic> languageColorMap = {
    'Gujarati': Colors.green,
    'Hindi': Colors.pink,
    'English': Constants.highlightColor, // Colors.orange,
    'German': Colors.yellow,
    'Spanish': Colors.blue,
    'Portuguese': Colors.brown,

    // 'Gujarati': Colors.orange,
    // 'Hindi': Colors.green,
    // 'English': Colors.red,
    // 'German': Colors.blue,
    // 'Spanish': Colors.yellow,
    // 'Portuguese': Colors.lightGreen,
  };

  static const Color highlightColor = Color(0xFFd77b0e);
  static const Color highlightColor1 = Color(0xFF828383);
}

// List _langNameList = ['ગુજરાતી', 'हिन्दी', 'English', 'Deutsch', 'Español', 'Portuguese'];

class Languages {
  static const GUJARATI = 'Gujarati';
  static const HINDI = 'Hindi';
  static const ENGLISH = 'English';
  static const GERMAN = 'German';
  static const SPANISH = 'Spanish';
  static const PORTUGUESE = 'Portuguese';

  static sortLanguageListByPreferredLanguage(
      List<String> languageList, String preferredLanguage) {
    List<String> sortedLanguageList = [];

    if (languageList.isNotEmpty) {
      if (languageList.contains(preferredLanguage)) {
        sortedLanguageList.add(preferredLanguage);
        languageList.remove(preferredLanguage);
      }
      sortedLanguageList = [...sortedLanguageList, ...languageList];
    }

    return sortedLanguageList;
  }
}

enum Language { GUJARATI, HINDI, ENGLISH, GERMAN, SPANISH, PORTUGUESE }

// enum LiveLanguage { GUJARATI, HINDI, ENGLISH, GERMAN, SPANISH, PORTUGUESE }

class TabIndex {
  static const int TV = 0;
  static const int LIVE_OR_SPECIAL = 1;
  // static const int SPECIAL = 2;
}

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
