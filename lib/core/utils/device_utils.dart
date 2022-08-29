import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

mixin DeviceUtils {
  static Future<String> getAppInfo() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return 'ORO ${packageInfo.version} ${packageInfo.buildNumber}';
  }

  static Future<String> getAppVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  static Future<String> getBuildNumber() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }

  static String getOsType() {
    return Platform.isAndroid ? 'android' : 'ios';
  }

  static Future<String> getOsName() async {
    return Platform.isIOS
        ? (await DeviceInfoPlugin().iosInfo).systemName ?? ''
        : (await DeviceInfoPlugin().androidInfo).version.release ?? '';
  }

  static Future<String> getOsVersion() async {
    return Platform.isIOS
        ? (await DeviceInfoPlugin().iosInfo).systemVersion ?? '1'
        : (await DeviceInfoPlugin().androidInfo).version.sdkInt.toString();
  }

  static Future<String> getManufacturer() async {
    return Platform.isIOS
        ? (await DeviceInfoPlugin().iosInfo).name ?? ''
        : (await DeviceInfoPlugin().androidInfo).manufacturer ?? '';
  }

  static Future<String> getModel() async {
    return Platform.isIOS
        ? (await DeviceInfoPlugin().iosInfo).model ?? ''
        : (await DeviceInfoPlugin().androidInfo).model ?? '';
  }

  static Future<String> getUserAgent() async {
    /**
     * the value should be:
     * APPLICATION_NAME/APPLICATION_VERSION (BUNDLE_IDENTIFIER; build:BUILD_NUMBER); SYSTEM SYSTEM_VERSION
     *
     * Sample:
     * ORO/1.0.0 (sa.oro.customer; build:1); iOS 15.1
     * ORO-Provider/1.0.0 (sa.oro.provider; build:1); Android 28.2
     */
    try {
      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String deviceOsVersion = '';

      if (Platform.isAndroid) {
        final androidInfo = await DeviceInfoPlugin().androidInfo;
        deviceOsVersion = androidInfo.version.sdkInt.toString();
      } else {
        final iosInfo = await DeviceInfoPlugin().iosInfo;
        deviceOsVersion = iosInfo.systemVersion?.toString() ?? '';
      }

      final String appName = packageInfo.appName;
      final String version = packageInfo.version;
      final String packageName = packageInfo.packageName;
      final String buildNumber = packageInfo.buildNumber;
      final String deviceType = Platform.isAndroid ? 'Android' : 'iOS';

      return '$appName/$version ($packageName; build:$buildNumber); $deviceType $deviceOsVersion';
    } on Exception catch (e) {
      print(e);
      return '';
    }
  }
}
