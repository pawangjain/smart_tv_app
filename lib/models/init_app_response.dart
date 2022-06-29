class InitAppResponse {
  String configVersion;
  // String latestIosAppVersion;
  String latestAndroidAppVersion;
  // String minimumRequiredIosAppVersion; //below which user is forced to update
  String minimumRequiredAndroidAppVersion; //below which user CANNOT USE APP
  String pullNotificationsUrl;
  String akonnectPromoVideoUrl;
  
  var sampleResponseOfData = {
    "config_version": "1",
    "latest_ios_app_version": "6.0.0",
    "latest_android_app_version": "6.0.0",
    "minimum_required_ios_app_version": "5.0.0",
    "minimum_required_android_app_version": "5.0.0",
    "repeat_alarm_time_in_minutes": 4,
    "alarm_offset_window_in_minutes": 0,
  };

  InitAppResponse.fromJson(Map<String, dynamic> json) {
    try {
      configVersion = json['config_version'];
      // latestIosAppVersion = json['latest_ios_app_version'];
      latestAndroidAppVersion = json['latest_android_app_version'];
      // minimumRequiredIosAppVersion = json['minimum_required_ios_app_version'];
      minimumRequiredAndroidAppVersion =
          json['minimum_required_android_app_version'];
    } catch (e) {
      print('#EXC $e');
    }
  }
}
