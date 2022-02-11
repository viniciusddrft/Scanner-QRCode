import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobController {
  static void initialize() => MobileAds.instance.initialize();

  static String get nativeAdUnitID => NativeAd.testAdUnitId;
}
