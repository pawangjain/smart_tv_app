import 'package:dadabhagwan_tv/common/constants.dart';

class Device {
  final String appVersion;
  final String deviceId;
  final String deviceModel;
  final String deviceOs;
  // bool isOnline;
  bool get isAndroidOs => deviceOs == 'android';
  bool get isFireOs => deviceOs == Constants.FIRE_OS;
  final String osVersion;
  final String appStoreUrl;
  final int androidSdkVersion;

  Device(
      {this.appVersion,
      this.deviceId,
      this.deviceModel,
      this.deviceOs,
      this.osVersion,
      this.appStoreUrl,
      this.androidSdkVersion});

  // Device() {
  //   //isOnline = true;
  // }

  // Device.fromJson(Map<String, dynamic> json) {
  //   appVersion = json['app_version'];
  //   deviceId = json['device_id'];
  //   deviceModel = json['device_model'];
  //   deviceOs = json['device_os'];
  //   osVersion = json['os_version'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = Map<String, dynamic>();

    json['app_version'] = appVersion;
    json['device_id'] = deviceId;
    json['device_model'] = deviceModel;
    json['device_os'] = deviceOs;
    json['os_version'] = osVersion;

    return json;
  }

  toString() {
    return 'DEVICE = ${this.appVersion} ${this.deviceId} '
        '${this.deviceModel} ${this.deviceOs} ${this.osVersion}';
  }
}
