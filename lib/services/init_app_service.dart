import 'package:dadabhagwan_tv/common/app_data.dart';
import 'package:dadabhagwan_tv/common/constants.dart';
import 'package:dadabhagwan_tv/models/device.dart';
import 'package:dadabhagwan_tv/services/shared_preferences_service.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

class InitAppService {
  static initializeDevice() async {
    // if (Platform.isAndroid) {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    AndroidBuildVersion buildVersion = androidInfo.version;

    // print(
    //     '## dada Running on  ${androidInfo.androidId} ${androidInfo.version.release} '
    //     '${androidInfo.id} ${androidInfo.model} ${androidInfo.manufacturer}'); // e.g. 'Moto G (4)'
    //## dada Running on  9ce4888b3eca509a 7.0 HONORBLN-L22 BLN-L22 HUAWEI

    /// Firestick TV
    /// (brand: Amazon, device: sheldon, product sheldon, display: P$7249, hardware: mt8695,
    /// devlceld; 001 cd1f8302037, &vac/Model; Amazon AFTSS, devIce0s: PPR1 .180610039,
    /// Kt oWerslon; 9, androldSdkVersion: 28, IsAndrold; true, appVersion' 1,0,0, buffo—. 1)

    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String deviceModel = androidInfo.manufacturer + ' ' + androidInfo.model;
    String deviceOs = 'android';
    String appStoreUrl = Constants.appPlayStoreUrl;

    if (deviceModel.toLowerCase().contains('amazon')) {
      /// On Amazon FireTV
      Constants.YOUTUBE_TV_APP_PACKAGE_ID = 'com.amazon.firetv.youtube';
      deviceOs = Constants.FIRE_OS;
      /// TODO: set amazon appstore app url here
      // appStoreUrl = '';
    }

    AppData.currPhysicalDevice = Device(
        deviceId: androidInfo.androidId,
        deviceModel: deviceModel,
        deviceOs: deviceOs, // buildVersion.baseOS,
        osVersion: buildVersion.release,
        androidSdkVersion: buildVersion.sdkInt,
        appVersion: packageInfo.version,
        appStoreUrl: appStoreUrl,);

    // AppData.currPhysicalDevice.addAll({
    //   // 'brand': androidInfo.brand,
    //   // 'device': androidInfo.device,
    //   // 'product': androidInfo.product,
    //   // 'display': androidInfo.display,
    //   // 'hardware': androidInfo.hardware,
    //   'deviceId': androidInfo.androidId,
    //   'deviceModel': androidInfo.manufacturer + ' ' + androidInfo.model,
    //   'deviceOs': 'android',// buildVersion.baseOS,
    //   // 'codename': buildVersion.codename,
    //   'osVersion': buildVersion.release,
    //   'androidSdkVersion': buildVersion.sdkInt,
    //   // 'isAndroid': Platform.isAndroid,
    //   'appVersion': packageInfo.version,
    //   // 'buildNumber': packageInfo.buildNumber,
    // });
  }

  static initApp() async {
    Constants.initializeApiUrls();
    await initializeDevice();
    await SharedPreferencesService.initSharedPreferences();
  }
}
