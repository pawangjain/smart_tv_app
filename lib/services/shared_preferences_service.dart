import 'package:dadabhagwan_tv/api/apiservice.dart';
import 'package:dadabhagwan_tv/common/app_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefConstants {
  static const String LIVE_PREFERRED_LANGUAGE = 'LIVE_PREFERRED_LANGUAGE';
  static const String WEBTV_24X7_PREFERRED_LANGUAGE =
      'WEBTV_24X7_PREFERRED_LANGUAGE';
  static const String IS_APP_INSTALLED_STAT_SENT = 'IS_APP_INSTALLED_STAT_SENT';
  static const String USE_YOUTUBE_APP_FOR_LIVE_SSG = 'USE_YOUTUBE_APP_FOR_LIVE_SSG';
  static const String AppUpdateReminderDate = 'AppUpdateReminderDate';
}

class SharedPreferencesService {
  static SharedPreferences _pref;

  static Future<void> initSharedPreferences() async {
    if (_pref == null) {
      _pref = await SharedPreferences.getInstance();
    }

    AppData.isAppInstalledStatSent =
        await getBool(SharedPrefConstants.IS_APP_INSTALLED_STAT_SENT) ?? false;

    AppData.useYoutubeAppForLiveSsg =
        await getBool(SharedPrefConstants.USE_YOUTUBE_APP_FOR_LIVE_SSG) ?? false;

    await logAppInstallStat();

    AppData.livePreferredLanguage =
        await getString(SharedPrefConstants.LIVE_PREFERRED_LANGUAGE) ??
            'Gujarati';
    AppData.webTv24x7PreferredLanguage =
        await getString(SharedPrefConstants.WEBTV_24X7_PREFERRED_LANGUAGE) ??
            'Gujarati';
  }

  static logAppInstallStat() async {
    if (!AppData.isAppInstalledStatSent) {
      AppData.isAppInstalledStatSent = true;
      var now = DateTime.now();
     
    }
  }

  static Future<void> setBool(String prefStr, bool isDone) async {
    // await loadPref();
    _pref.setBool(prefStr, isDone);
  }

  static Future<bool> getBool(String prefStr,
      {bool defaultValue = false}) async {
    // await loadPref();
    return _pref.getBool(prefStr) == null
        ? defaultValue
        : _pref.getBool(prefStr);
  }

  static Future<String> getString(String prefStr, {String defaultValue}) async {
    // await loadPref();
    return _pref.getString(prefStr) == null
        ? defaultValue
        : _pref.getString(prefStr);
  }

  static Future<void> setString(String prefStr, String value) async {
    // await loadPref();
    _pref.setString(prefStr, value);
  }
}
