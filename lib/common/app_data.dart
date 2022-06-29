import 'package:dadabhagwan_tv/common/constants.dart';
import 'package:dadabhagwan_tv/models/CurTvProgramModel.dart';
import 'package:dadabhagwan_tv/models/LiveInfoModel.dart';
import 'package:dadabhagwan_tv/models/TVScheduleModel.dart';
import 'package:dadabhagwan_tv/models/device.dart';
import 'package:dadabhagwan_tv/models/init_app_response.dart';
import 'package:flutter/material.dart';

class AppData {
  static bool isOnline = true; //false;
  static int currentTabIndex = 0;
  static int currentFocusedTabIndex = -1;

  // static Map currPhysicalDevice = {};
  static Device currPhysicalDevice;
  static InitAppResponse initAppResponse;

  static Language webTvSelectedLanguage;

  static String livePreferredLanguage;
  static String webTv24x7PreferredLanguage;
  static bool isAppInstalledStatSent = false; //false;
  static bool useYoutubeAppForLiveSsg = false; //false;

  static List<Tvschedule> currentLanguageWebTvScheduleList = [];

  static CurTVProgramModel curTVProgramModel;
  static List<Tvschedule> currentLanguageTvSchedule = [];

  static LiveInfoModel liveInfo = LiveInfoModel();

  static FocusNode currentFirstLangFocusNode;
  static FocusNode firstWebTvLangFocusNode = FocusNode();
  static FocusNode firstLiveLangFocusNode = FocusNode();
}
